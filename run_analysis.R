library(data.table)
library(dplyr)
library(plyr)
library(stringr)


build_tidy_dataset <- function(type){
  
  setwd(type)
  # Load Subject IDs for each record
  d_subject_id <- read.table(paste0("subject_",type,".txt"))
  colnames(d_subject_id) <- c("SubjectId")
  
  # Load activity label ID fo each record
  d_act_lbl_id <- read.table(paste0("y_",type,".txt"))
  
  # Load features variable data
  d_features <- read.table(paste0("x_",type,".txt"))
  colnames(d_features) <- v_column_names
  
  setwd("Inertial Signals")
  
  # Load files for Angular velocity from gyroscope
  d_body_gyro_x <- read.table(paste0("body_gyro_x_",type,".txt"))
  d_body_gyro_y <- read.table(paste0("body_gyro_y_",type,".txt"))
  d_body_gyro_z <- read.table(paste0("body_gyro_z_",type,".txt"))
  
  # LOad files for total acceleration from accelerometer
  d_total_acc_x <- read.table(paste0("total_acc_x_",type,".txt"))
  d_total_acc_y <- read.table(paste0("total_acc_y_",type,".txt"))
  d_total_acc_z <- read.table(paste0("total_acc_z_",type,".txt"))
  
  # Load files for estimated body acceleration
  d_body_acc_x <- read.table(paste0("body_acc_x_",type,".txt"))
  d_body_acc_y <- read.table(paste0("body_acc_y_",type,".txt"))
  d_body_acc_z <- read.table(paste0("body_acc_z_",type,".txt"))
  
  
  #Joining the activity label id and names data frames.
  ##3. Uses descriptive activity names to name the activities in the data set
  d_activity <- join(d_act_lbl_id, d_act_lbl_name)
  colnames(d_activity) <- c("ActivityId", "ActivityName")
  
  
  # Build the final table
  
  d_tidy <- cbind(d_subject_id, d_activity, d_features, 
                  "BodyGyro X" = as.list(d_body_gyro_x),
                  "BodyGyro Y" = as.list(d_body_gyro_y),
                  "BodyGyro Z" = as.list(d_body_gyro_z),
                  "TotalAcc X" = as.list(d_total_acc_x),
                  "TotalAcc Y" = as.list(d_total_acc_y),
                  "TotalAcc Z" = as.list(d_total_acc_z),
                  "EstimatedBodyAcc X" = as.list(d_body_acc_x),
                  "EstimatedBodyAcc Y" = as.list(d_body_acc_y),
                  "EstimatedBodyAcc Z" = as.list(d_body_acc_z))
  
  d_tidy
}


#set the path:
setwd("UCI HAR Dataset")
mypath <- getwd()

##1. Merges the training and the test sets to create one data set.

# Read common data:

# Load activity label Names fo each record
d_act_lbl_name <- read.table("activity_labels.txt")

# Load features variable column names
d_features_names <- read.table("features.txt")
v_column_names <- d_features_names[,2]

# clean the feature column names
v_column_names <- gsub("-", "_", v_column_names)
v_column_names <- gsub(",", "_", v_column_names)
v_column_names <- gsub("\\(", " ", v_column_names)
v_column_names <- gsub("\\)", " ", v_column_names)


#setwd("C:/Manonita Mishra/Data Science Projects/~John Hopkins/Getting and Cleaning Data/Week4/UCI HAR Dataset")
tidy_test <- build_tidy_dataset("test")

setwd(mypath)
#setwd("C:/Manonita Mishra/Data Science Projects/~John Hopkins/Getting and Cleaning Data/Week4/UCI HAR Dataset")
tidy_train <- build_tidy_dataset("train")

final_dataset <- rbind(tidy_test, tidy_train)
setwd(mypath)

##2. Extracts only the measurements on the mean and standard deviation for each measurement
  
final_dataset_col_names <- names(final_dataset)
mean_std_col_names <- c(1:3,grep("mean|std",final_dataset_col_names))
tidy_mean_std_col_data <- final_dataset[,mean_std_col_names]


# 4. Appropriately labels the data set with descriptive variable names.
# Replace strings:
tempColNames <- names(tidy_mean_std_col_data)
tempColNames <- gsub("_", "", tempColNames)
# t -> Time
tempColNames <- sub("^t", "Time.", tempColNames)
# f -> Frequency
tempColNames <- sub("^f", "Freq.", tempColNames)
# Gyro -> Gyroscope
tempColNames <- sub("Gyro", "Gyroscope.", tempColNames)
# Acc -> Accelerometer
tempColNames <- sub("Acc", "Accelerometer.", tempColNames)
# Mag -> Magnitude
tempColNames <- sub("Mag", "Magnitude.", tempColNames)
# mean -> Mean
tempColNames <- sub("mean", ".Mean.", tempColNames)
# std -> STD
tempColNames <- sub("std", ".STD.", tempColNames)
#remove all spaces
tempColNames <- sub(" ", ".", tempColNames)
tempColNames <- gsub("\\.\\.", "\\.", tempColNames)


#set the appropriate column names
names(tidy_mean_std_col_data) <- tempColNames


##5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.

tidy_average_data <- aggregate(tidy_mean_std_col_data[,4:82], 
                               by = list(tidy_mean_std_col_data$SubjectId, tidy_mean_std_col_data$ActivityId,tidy_mean_std_col_data$ActivityName), 
                               FUN = "mean",
                               simplify = TRUE)


##########################
write.table(tidy_mean_std_col_data, file="tidy_data.txt", sep = "\t", col.names = TRUE)



