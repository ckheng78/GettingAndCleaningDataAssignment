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
2. 
