# Getting-and-Cleaning-Data-Course-Project
This repository hosts the R code and documentation files for Course project for Data Science "Getting and Cleaning Data"
Ernesto Budia Sanchez 18/12/2016

## Files

+ CodeBook.md describes the how to use all this, variables, the data, and any transformations or work that was performed to clean up the data.

+ run_analysis.R:  R script that does the following:
    
    + download data.zip from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    + Uncompress data.zip
    + Merges the training and the test sets to create one data set.
    + Extracts only the measurements on the mean and standard deviation for each measurement.
    + Uses descriptive activity names to name the activities in the data set
    + Appropriately labels the data set with descriptive variable names.
    + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

+ tidydataset.txt The output of the last step, contains the average of each variable for each activity and each subject. Uploaded in the course project's form.

## Data
+ data for the project https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Requiere
+ Library dprly https://cran.r-project.org/web/packages/dplyr/index.html




