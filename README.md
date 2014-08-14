Getting and Cleaning Data - Course Project
==========================================

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Instruction List
--------------
We have created an R script called **run_analysis.R** (uploaded in repo) that does the following:

1. Merges the training and the test sets to create a single data set, stored in file **tidy_UCI_HAR.txt**.
2. While creating the single data set, only the measurements on the mean and standard deviation for each measurement were retained. For this, we have used regular expression matching to extract all features whose names end with either **mean()** and **std()** (as provided in features.txt).
3. Replaces activity ids (1-6) with corresponding activity names in the data set (as provided in activity_labels.txt).
4. Appropriately labels the data set with feature names (as provided in features.txt). 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
