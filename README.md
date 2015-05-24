README for Course Project - Getting and Cleaning Data - May 24, 2015

This readme file will be found next to the script run_analysis.R. The latter should be run to generate the tidy data.txt file that was the requested output for the course project.

The necessary starting files are in the folder "UCI HAR Dataset", which should be in your working directory. The scrip will read a number of tables from the "UCI HAR Dataset" folder:

UCI HAR Dataset/activity_labels.txt
UCI HAR Dataset/features.txt

UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/train/y_train.txt
UCI HAR Dataset/train/X_train.txt

Column names for these files are assigned during the initial read. The X_train and X_Test files get their names from reading the features.txt

The rest of the code is explained within the script.
