#Ernesto Budia Sánchez
#Getting and Cleaning Data Course Project

#Download data
if (!file.exists('data.zip')){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL,destfile = 'data.zip', method="curl")
}  

#unzip data
if (!file.exists("UCI HAR Dataset")) { 
  unzip('data.zip') 
}


###############################################################
#1 Merges the training and the test sets to create one data set
###############################################################

# Read train
strain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")

# Read test
stest<- read.table("UCI HAR Dataset/test/subject_test.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/Y_test.txt")

# Merge data set
train<-cbind(strain,xtrain,ytrain)
test<-cbind(stest,xtest,ytest)

dataset<-rbind(train,test)

# Read data column names
xnames <- read.table("./UCI HAR Dataset/features.txt",
                     stringsAsFactors = FALSE)[[2]]

# rename variable
vnames<-c("subject",xnames,"activity")
names(dataset)<-vnames


###############################################################
#2 Extracts only the measurements on the mean and standard 
#  deviation for each measurement.
###############################################################

# Get variable with text "mean()" and "std()"
# Dont get variables with text like meanFreq or kMean 
# Get variable Subject-id and "activity"

dataset<-dataset[,grepl("subject|mean[(][)]|std[(][)]|activity",
                        vnames)]


###############################################################
#3  Uses descriptive activity names to name the activities 
#   in the data set
###############################################################

# Read activity labels like "character"
activity <- read.table("./UCI HAR Dataset/activity_labels.txt",
                       stringsAsFactors = FALSE)[[2]]

# Activity is ordered, i use cut function to convert numeric to factor
# breaks = 6 because there ara 6 activities
dataset$activity<-cut(dataset$activity,breaks = 6,labels = activity)


###############################################################
#4 Appropriately labels the data set with descriptive variable 
#  names.
###############################################################

# Done previously section 1
names(dataset)


###############################################################
#5 From the data set in step 4, creates a second, independent 
#  tidy data set with the average of each variable for each 
#  activity and each subject.
###############################################################


library(dplyr)
tidydataset<-dataset %>%
              group_by(activity,subject) %>%
              summarise_all(mean)

write.table(tidydataset,file="tidydataset.txt",row.name=FALSE)

