#### Code for the Getting and Cleaning Data Project

library(dplyr)
library(stringr)

## Download and unzip the dataset

setwd("G:/Coursera/03 - Getting and Cleaning Data/Week 4 - Quiz")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "UCI HAR Dataset.zip")

filename <- "UCI HAR Dataset.zip"

if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
  }

## Load activity labels

activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Load features and extract only the mean and SD measurements

features <- read.table("./UCI HAR Dataset/features.txt")
featuresSelected <- features %>%
  filter(str_detect(V2, "mean|std")) %>%
  mutate(V2 = str_replace_all(V2, "[-()]", "")) %>%
  mutate(V2 = str_replace_all(V2, "std", "Std")) %>%
  mutate(V2 = str_replace_all(V2, "mean", "Mean"))

## Load the training dataset and extract the desired features

trainSubject <- read.table ("./UCI HAR Dataset/train/subject_train.txt")
trainActivities <- read.table ("./UCI HAR Dataset/train/y_train.txt")
trainSet <- read.table ("./UCI HAR Dataset/train/X_train.txt")
trainSetSelected <- trainSet %>%
  select_(.dots = featuresSelected[,1])
train <- cbind(trainSubject, trainActivities, trainSetSelected)

## Load the test dataset and extract the desired features

testSubject <- read.table ("./UCI HAR Dataset/test/subject_test.txt")
testActivities <- read.table ("./UCI HAR Dataset/test/y_test.txt")
testSet <- read.table ("./UCI HAR Dataset/test/X_test.txt")
testSetSelected <- testSet %>%
  select_(.dots = featuresSelected[,1])
test <- cbind(testSubject, testActivities, testSetSelected)

## Combine the training and test datasets, and assign column names

combined <- rbind(train,test)
colnames(combined) <- c("subject", "activity", featuresSelected[,2])
combined$activity <- factor(combined$activity, levels = activitylabels[,1], labels = activitylabels[,2])

## Create the a tidy dataset with the average of each variable
## for each activity and each subject

combinedMean <- combined %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

## Write the table to a txt file

write.table(combinedMean, "tidydata.txt", row.names = FALSE, quote = FALSE)
