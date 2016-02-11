library(dplyr)

## Grab the Text Files
setwd("/Users/daniellocasto/Desktop/Course Project/UCI HAR Dataset")
features     <- read.table("features.txt")
labels       <- read.table("activity_labels.txt")

X_training   <- read.table("train/X_train.txt")
y_training   <- read.table("train/y_train.txt")
sub_training <- read.table("train/subject_train.txt")

X_testing    <- read.table("test/X_test.txt")
y_testing    <- read.table("test/y_test.txt")
sub_testing  <- read.table("test/subject_test.txt")


## Rename the Columns
colnames(labels) <- c("V1", "Activity")

colnames(sub_training) <- c("Subject")
colnames(X_training) <- features[,2]

colnames(sub_testing) <- c("Subject")
colnames(X_testing) <- features[,2]


## Combine the Training Tables
training_1 <- cbind(y_training, sub_training)
training_2 <- merge(training_1, labels, by = ("V1"))
training_3 <- cbind(training_2, X_training)
training_4 <- training_3[,-1]
training_5 <- select(training_4, contains("Subject"), contains("Activity"), contains("mean"), contains("std"))


## Combine the Testing Tables
testing_1 <-cbind(y_testing, sub_testing)
testing_2 <- merge(testing_1, labels, by = ("V1"))
testing_3 <- cbind(testing_2, X_testing)
testing_4 <- testing_3[,-1]
testing_5 <- select(testing_4, contains("Subject"), contains("Activity"), contains("mean"), contains("std"))


## Combine Training & Testing Data - Measurements of Mean & StDeviation
combine_data <- rbind(training_5, testing_5)


## Reformat the Column Names 
names(combine_data) <- gsub("^t", "Time", names(combine_data))
names(combine_data) <- gsub("Acc", "Accelerometer", names(combine_data))
names(combine_data) <- gsub("Gyro", "Gyroscope", names(combine_data))
names(combine_data) <- gsub("Mag", "Magnitude", names(combine_data))
names(combine_data) <- gsub("^f", "Frequency", names(combine_data))
names(combine_data) <- gsub("BodyBody", "Body", names(combine_data))
names(combine_data) <- gsub("angle", "Angle", names(combine_data))
names(combine_data) <- gsub("std", "StDev", names(combine_data))
names(combine_data) <- gsub("mean", "Mean", names(combine_data))
names(combine_data) <- gsub("gravity", "Gravity", names(combine_data))
names(combine_data) <- gsub("tBody", "TimeBody", names(combine_data))


## Independent Tidy Data Set w/ Average of Each Variable by Activity & Subject
run_analysis <- (combine_data %>%
                        group_by(Subject, Activity) %>%
                                summarize_each(funs(mean)))