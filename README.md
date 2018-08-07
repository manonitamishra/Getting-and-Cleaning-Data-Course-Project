###The purpose of this document is to explain the execution steps followed in the run_analysis.R script.

###**Functions:**
###The script has one function *build_tidy_dataset*
###**Purpose** The function reads all the files from the "test" or the "train" folder based the value of its input parameter *type*
###**Input:** type. Possible values are "test" or "train"
###**Output:** a tidy data frame which has data for all the subjects, activities, features from the test/train folder. The activity labels for the corresponding activity ids are also added.

###**Below are are high-level steps of execution:**
###1. Read the column names from the "*features.txt*" files and clean up the names by removing unwanted special characters.
###2. Call the *build_tidy_dataset* function to create tidy data frames objects *tidy_testt* and *tidy_train*
###3. *rbind tidy_test and tidy_train* data sets to create the *final_dataset*
###4. Extract the columns with *mean or std* in their column names and subset data from these columns of the *final_dataset* to create the *tidy_mean_std_col_data* tidy dataframe
###5. Appropriately labels the dataframe with descriptive variable names by using a series of sub and gsub functions.
###6. Create *tidy_average_data* dataframe to compute the average of each column of the *tidy_mean_std_col_data* per subject and per activity using the *aggregate* function.