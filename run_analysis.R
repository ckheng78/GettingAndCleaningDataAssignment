require(data.table)
require(plyr)

library(data.table)
library(plyr)

# if essential files not found, unable to continue
files_list <- c("./X_test.txt", "./y_test.txt", "./subject_test.txt",
                "./X_train.txt", "./y_train.txt", "./subject_train.txt",
                "features.txt", "activity_labels.txt")
# if any of the files are not found, stop
sapply(files_list, function(x) {
        if (!file.exists(x))
                stop(paste(x, " not found!", sep = ""))
})

#######################
# Answer to Question 1
#######################
# Extract test data
test_data <- data.table(read.table("./X_test.txt"))
test_activity <- data.table(read.table("./y_test.txt"))
test_subject <- data.table(read.table("./subject_test.txt"))

test_rec_count <- length(test_data[, .I])

# Combine test data
test_data[, activity_code:=test_activity]
test_data[, subject:=test_subject]
test_data[, group:=rep("test", test_rec_count)]

# Extract train data
train_data <- data.table(read.table("./X_train.txt"))
train_activity <- data.table(read.table("./y_train.txt"))
train_subject <- data.table(read.table("./subject_train.txt"))

train_rec_count <- length(train_data[, .I])

# Combine train data
train_data[, activity_code:=train_activity]
train_data[, subject:=train_subject]
train_data[, group:=rep("train", train_rec_count)]

# row bind both test and train data set
final_data_set <- rbind(test_data, train_data)

#######################
# A1: final_data_set now contains combined data sets from test set and train set
#######################

#######################
# Answer to Question 2
#######################
features_code_table <- data.table(read.table("./features.txt", stringsAsFactors = F))
# grep all features with keyword mean and std
features_with_m_std <- features_code_table[, grep("mean|std", V2)]

# extract needed features and remove those not needed
features_filtered_table <- features_code_table[features_with_m_std]

# concat V in front so that it will match the column names in final_data_set
features_filtered_table$V1 <- sapply(features_filtered_table$V1, function(x) {paste("V", x, sep="")})

# complete the filtering list by adding activity, subject and group
column_list <- c(features_filtered_table$V1, "activity_code", "subject", "group")

# remove non-needed columns from our data set, note that with=F is important, otherwise it will stop at
# V6
final_data_set <- final_data_set[, column_list, with=F]

#######################
# A2: final_data_set now contains only mean and std measurements
#######################

#######################
# Answer to Question 3
#######################
# read in the activity code and text
activity <- data.table(read.table("activity_labels.txt", stringsAsFactors = F))
# rename the column to more friendly names
setnames(activity, c("V1", "V2"), c("activity_code", "activity"))

# join activity code to the activity text to replace all activity with text
final_data_set <- join(final_data_set, activity, by = "activity_code", type = "left")
# drop unneeded activity_code
final_data_set <- final_data_set[, c("activity_code") := NULL]
#######################
# final_data_set$activity has been replaced with its description
#######################

#######################
# Answer to Question 4
#######################
# extract the new column names
column_old_name <- features_filtered_table$V1
column_new_name <- features_filtered_table$V2

# apply new column names
setnames(final_data_set, column_old_name, column_new_name)
#######################
# final_data_set features has been given descriptive names
#######################

#######################
# Answer to Question 5
#######################
final_data_mean <- final_data_set[, lapply(.SD, mean), by=c("activity", "subject", "group")]
#######################
# final_data_mean contains mean for each variable for each subject each activity
#######################

#######################
# dump the final_data_set and final_data_mean
#######################
write.table(final_data_set, "./tidy_data_set.csv", sep=",", quote=F, row.names=F)
write.table(final_data_mean, "./tidy_data_mean.csv", sep=",", quote=F, row.names=F)
