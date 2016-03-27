# Getting And Cleaning Data Assignment

## Introduction
run_analysis.R is a script that will combine data sets from test and training data set into a single set. It will keep only mean and standard deviation of each measurements, provide descriptive labels for all measurement columns and activity and generate a second tidy data set that is the average of each variable for each activity and each subject.

## Expected output
If the script is executed correctly, it will generate tidy_data_set.csv and tidy_data_mean.csv in the same folder or directory where the script is located in.

## Prequiste
1. The raw data set from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Data Set")
2. data.table R package installed.
3. plyr R package installed.

## Setup
1. Expand the download data set into a folder, like say, "./assignment"
2. Download run_analysis.R to the same folder as the download data set. Let assume it is the suggested "./assignment"
3. Start R studio
4. Switch current working directory to "./assignment"
5. source("run_analysis.R") to execute the script
6. If the script is executed correctly, two files will be generated in "./assignment" folder: tidy_data_set.csv and tidy_data_mean.csv. The first file contains the combined tidy data set. The second file contains the average of all variables for each activity each subject

## Troubleshooting
* The script throws an error saying XXX not found!
  * Please ensure the script and the data set is in the same folder. Do note that the script expects "activity_labels.txt" and "features.txt" to be in the same folder as the script while "X_test.txt", "y_test.txt" and "subject_test.txt" in the "test" sub-folder and "X_train.txt", "y_train.txt" and "subject_train.txt" in the "train" sub-folder.
* The script throws an error stating "data.table" or "plyr" not found.
  * Please install "data.table" or "plyr" library using install.packages("data.table") and install.packages("plyr").
