## Getting and Cleaning Data
## Week 4 - Peer-graded Assignment
##   -----------------------
## Samsung data must be in your working directory



# Features ----------------------------------------------------------------
features <- read.table("./UCI HAR Dataset/features.txt")

## The following code cleans "features" by generally making the activity names
## more descriptive and removing punctuation
features[,2] <- gsub("^t","time",features[,2])
features[,2] <- gsub("()","",features[,2], fixed = TRUE)
features[,2] <- gsub("Body","body",features[,2])
features[,2] <- gsub("Acc","accelerometer",features[,2])
features[,2] <- gsub("-","",features[,2])
features[,2] <- gsub("G","g",features[,2])
features[,2] <- gsub("J","j",features[,2])
features[,2] <- gsub("^f","frequency",features[,2])
features[,2] <- gsub("(","",features[,2],fixed = TRUE)
features[,2] <- gsub(")","",features[,2],fixed = TRUE)
features[,2] <- gsub("Mean","mean",features[,2],fixed = TRUE)
features[,2] <- gsub("Energy","energy",features[,2],fixed = TRUE)
features[,2] <- gsub(",", "", features[,2],fixed = TRUE)



# Test Data ---------------------------------------------------------------

featurestest <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Appropriately labels the data set with descriptive variable names:
names(featurestest) <- features[,2] 

activitytest <- read.table("./UCI HAR Dataset/test/Y_test.txt") 

## The following converts activitytest from integer to factor:
activitiesfactorstest <- factor(activitytest[,1]) 
levels(activitiesfactorstest) <- c("walking", "walkingupstairs", 
                                   "walkingdownstairs", "sitting", "standing", 
                                   "laying") 

subjecttest<- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Merges test data:
mergedtest <- cbind(subjecttest, activitiesfactorstest, featurestest) 
names(mergedtest)[1:2] <- c("subject", "activity")


# Train data --------------------------------------------------------------

## Applies similar code from Test data to train data:

featurestrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(featurestrain) <- features[,2] 
activitytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt") 
activitiesfactorstrain <- factor(activitytrain[,1])
levels(activitiesfactorstrain) <- c("walking", "walkingupstairs", 
                                    "walkingdownstairs", "sitting", "standing", 
                                    "laying")
subjecttrain<- read.table("./UCI HAR Dataset/train/subject_train.txt" )
mergedtrain <- cbind(subjecttrain, activitiesfactorstrain, featurestrain) 
names(mergedtrain)[1:2] <- c("subject", "activity")


# Merge train and test datasets -------------------------------------------

## Merges the training and the test sets to create one data set:
mergedData <- rbind(mergedtest, mergedtrain)


## Extracts only the measurements on the mean and standard deviation for each 
## measurement.
install.packages("dplyr")
library(dplyr)
mergedData <- cbind(mergedData[,1:2], select(mergedData, grep("std|mean", 
                    names(mergedData))))

## Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject
test <- mergedData %>% 
    group_by(subject,activity) %>%
    summarise(across(timebodyaccelerometermeanX:angleZgravitymean, .fns=mean))
                     
## saves tidy data set as "tidydataset.txt"
write.table(test, file="tidydataset.txt", sep=" ", row.names = TRUE,
            col.names = TRUE,) 

# End ---------------------------------------------------------------------

