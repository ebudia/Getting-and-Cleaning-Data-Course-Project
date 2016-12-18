# CodeBook Getting-and-Cleaning-Data-Course-Project
CodeBook describes the variables, the data, and any transformations or work that you performed to clean up the data
Ernesto Budia Sanchez 18/12/2016

## Download data
Donwload data from url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to file data.zip

## unzip data
Decompress data, data.zip is path UCI HAR Dataset with follow files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## 1 Merges the training and the test sets to create one data set

+ Read and join with cbind the follow files to create dataset called train:
  + train/subject_train.txt
  + train/X_train.txt
  + train/y_train.txt
+ Read and join with cbind the follow files to create dataset called test:
  + test/subject_test.txt
  + test/X_test.txt
  + test/y_test.txt
+ Merge train and test with rbind to create "dataset"
+ Read feature names form 
  + features.txt   
+ Change the names of column of "dataset"
  + First varible called "subject"
  + 561 variables use features.txt
  + last varible called activity
+ "dataset" 10299 obseravations of 563 variables

## 2 Extracts only the measurements on the mean and standard deviation for each measurement.

+ Get variable with text "mean()" and "std()"
+ NOTE: I dont get variables with text like "meanFreq" or "kMean"
+ Get variable "subject" and "activity"
+ "dataset" 10299 obseravations of 68 variables

## 3  Uses descriptive activity names to name the activities in the data set

+ Read activity labels like "character" to create "activity"
  + "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" "STANDING" "LAYING"
+ Use cut function to convert numeric to factor with 
  + breaks = 6 because there ara 6 activities
  + labels =activity
  
## 4 Appropriately labels the data set with descriptive variable names.

+ # Done previously section 1

## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

+ use library dplry https://cran.r-project.org/web/packages/dplyr/index.html
+ tidydataset is created from data set: 
  + group_by activity and subjet
  + summarise_all(mean)

+ finally create tidydataset.txt

