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

test<-read.table("UCI HAR Dataset/test/X_test.txt")
train<-read.table("UCI HAR Dataset/train/X_train.txt")
