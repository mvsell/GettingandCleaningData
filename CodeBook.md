activity: object holding the activity_labels.txt
features: object holding the features.txt

subjectTest: object holding the subject_test.txt
activityTest: object holding the y_test.txt
featuresTest: object holding the X_test.txt
subjectTrain: object holding the subject_train.txt
activityTrain: object holding the y_train.txt
featuresTrain: object holding the X_train.txt

test: object holding the combination of subject, activity and features test data
train: object holding the combination of subject, activity and features training data

datamerge: object holing the merged training and test data (both have the same column names)

datastats: object holding the columns with mean or std

pretidy2: object with relabeled activities using strings instead of numbers - uses datastats
pretidy1: object with relabeled activities using strings instead of numbers - uses datamerge (bigger)


tidydata2: independent tidy data set with the average of each variable for each activity and each subject - uses pretidy2
tidydata1: independent tidy data set with the average of each variable for each activity and each subject - uses pretidy1

output: write.table(tidydata2, "tidydata.txt",row.name=FALSE)

For additional information on specific files, see the readme and info files in the "UCI HAR Dataset" folder
There are 561 features described in the features_info.txt file.