# Getting and Cleaning Data  - Coursera - Project 1
# This script is used for:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
install.packages("dplyr")
library(dplyr)
# Prestep 1: Import the datasets and label the columns
activity <- read.table(file = "UCI HAR Dataset/activity_labels.txt", col.names = c("ID_Act","LABEL_Act"))
features <- read.table(file = "UCI HAR Dataset/features.txt", col.names = c("ID_Feat","LABEL_Feat"))

subjectTest <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", col.names="ID_Subj")
#head(subjectTest)
activityTest <- read.table(file = "UCI HAR Dataset/test/y_test.txt", col.names="ID_Act")
#head(activityTest)
featuresTest <- read.table(file = "UCI HAR Dataset/test/X_test.txt", col.names=features$LABEL_Feat)
#head(featuresTest)
subjectTrain <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", col.names="ID_Subj")
#head(subjectTrain)
activityTrain <- read.table(file = "UCI HAR Dataset/train/y_train.txt", col.names="ID_Act")
#head(activityTrain)
featuresTrain <- read.table(file = "UCI HAR Dataset/train/X_train.txt", col.names=features$LABEL_Feat)
#head(featuresTrain)

# Prestep 2: combine the columns from each of the training and test sets.
test <- cbind(subjectTest, activityTest, featuresTest)
train <- cbind(subjectTrain, activityTrain, featuresTrain)

# Step 1: Merge the test and training sets
datamerge <- rbind(test,train)

# Step 2: Extracts measurements of means and sd using grep
datastats <- datamerge[,grep("mean|std", features$LABEL_Feat, perl=TRUE)]
colnames(datastats)

# Step 3: Uses descriptive activity names to name the activities in the data set - which dataset to apply this to was unclear to me.

# using results from step 2
pretidy2 <- within(datastats, ID_Act <- factor(ID_Act, labels = activity$LABEL_Act))
# using all results
pretidy1 <- within(datamerge, ID_Act <- factor(ID_Act, labels = activity$LABEL_Act))

# Step 4: Appropriately labels the data set with descriptive variable names. 
# This was done during Prestep 1 using col.names and preparation of datasets

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Using results from mean and std, see Step 3 - or all resutls, see step 1.
tidydata2 <- ddply(pretidy2, .(ID_Act, ID_Subj), numcolwise(mean))
tidydata1 <- ddply(pretidy1, .(ID_Act, ID_Subj), numcolwise(mean))
