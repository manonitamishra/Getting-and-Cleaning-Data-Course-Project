---
title: "README"
output: word_document
---

Prerequisites:
Download the data set package and set the working directory to the location of the unzipped folder.

build_tidy_dataset(type, ActivityName, column names)
This function is called from merge_datasets function. It is used read the respective files in the 'Test' and 'Train' folders.
*type -> "test"/"Train"
*ActivityName -> passed from merge_datasets function
*column names --> passed from merge_datasets function

merge_datasets()
This function merges the data from the test and train folders.

mean_std_df(mergedDataset)
This function extracts only the measurements on the mean and standard deviation for each measurement

clean_df_columnnames(mergedDataset)
Uses descriptive activity names to name the activities in the data set

average_df(mergedDataset)
Create a tidy data set with the average of each variable for each activity and each subject.

generateCodeBook(mergedDataset)
Generates the code book for the final tidy data set.

