Cleaning Dataset  
=================
###Human Activity Recognition Using Smartphones

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Instruction List
----------------
***Pre Condition***: The data is downloaded from the link above and unzipped in the working directory of R. The data directory name is "UCI HAR Dataset".

Run the R script called **run_analysis.R** (uploaded in repo) to accomplish the following:

1. Merge the training and the test sets to create a single data set, stored in file **tidy_UCI_HAR.txt**. While creating the single clean data set:
 * Only the measurements on the mean and standard deviation for each measurement were retained. For this, we have used regular expression matching to extract all features (as provided in features.txt) whose names have either string **mean** or **std**.
 * Activity ids (1 through 6) have been replaced with corresponding activity names in the data set, as provided in activity_labels.txt.
 * Data set variables have been appropriately labelled with feature names. The feature names were extracted from features.txt and cleaned such that column names are   1. all lower case, 2. descriptive and 3. not having underscored or dots or brackets.
 * The tidy data set has **10299 observations of 81 variables**.
2. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
