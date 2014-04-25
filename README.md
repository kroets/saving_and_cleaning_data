Getting and cleaning data
========================================================

Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) into a folder on your local drive C:\Users\yourname\Documents\R\

Put the file run_analysis.R to C:\Users\yourname\Documents\R\Analysis\UCI HAR Dataset\

In RStudio setwd("C:/Users/yourname/Documents/R/Analysis/UCI HAR Dataset/") and then source("run_analysis.R") 

The R script will read the datasets and write several files : testData, testData_act, testData_sub, trainData, trainData_act, trainData_sub,features,bigdata(the merged data file of 10299 observations of 563 variables), tidy (a second, independent tidy data set with the average of each variable for each activity and each subject)

At the end the script will wrirte a tidy.txt file in your workinf directory


