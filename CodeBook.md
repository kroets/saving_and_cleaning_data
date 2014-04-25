Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

the R script (run_analysis.R) performs the cleaning and the analysis of the original data.

The script reads the text files and merges the training and tests data sets to create datasets called trainData (7352 observations of 563 variables) and testData (2947 observations of 563 variables).

Then the script reads the activity_labels.txt file to create a dataset called activities (6 observations of 2 variables)

Creation of a dataset called features (561 observations of 2 variables) by reading the features.txt file to create the column names of the  future merged dataset.

The datasets trainData and testData are merged in one big dataset with the column names from features and with activitys and subjects. The big dataset is called bigdata (10299 observations of 563 variables)

Extraction of the mean (mean) of each column : bigdata_mean ; and the standard deviation (sd) of each column bigdata_sd.

Creation of a tidy dataset called tidy (180 observations of 479 variables) with the mean and the standard deviation by activity and by subject.