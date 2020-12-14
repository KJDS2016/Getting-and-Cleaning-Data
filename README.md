# Getting-and-Cleaning-Data
Week 4 - Peer-graded Assignment

As described in the assignment instructions, the data used for this project is "collected from the accelerometers from the Samsung Galaxy S smartphone." and detailed description is available from the source website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was downloaded from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Before running the script (run_analysis.R), extract he contents of the zip file downloaded from the above link to your working directory before running run_analysis.R. 

The script does does the following:
1. Stores "features.txt" file contents in features data frame object, which consists of 561 variable names representing various measurements described in features_info, to generally make variable names more descriptive by replacing many abbreviations with complete words, making some words all lowercase, and removing various punctuation/symbols. 
2. Reads data from the 3 text files in the "test" directory and stores them in data frame objects. X_test.txt is stored in featurestest and consists of 2947 observations of  561 variables in features.txt. Column names of featurestest are renamed with the "cleaned" names from features. Y_test is stored in activitytest, 	consisting of 561 obs. of  1 variable (the activity code). activity test is converted to a factors object, activitiesfactorstest, with levels corresponding to the 6 descriptions in activity_labels.txt. subject_test.txt is stored in subjettest and consists of 2947 obs. of  1 variable representing the applicable subject volunteer in the test group. cbind is used to bind data from these 3 data frames into a new object, mergedtestdata.
3. Reads data from the 3 text files in the "train" directory and stores them in data frame objects. Y_test.txt is stored in featurestrain and consists of 7352 observations of  561 variables in features.txt. Column names of featurestrain are renamed with the "cleaned" names from features. Y_train is stored in activitytrain, 	consisting of 2947 observations of  1 variable (the activity code). activitytrain is converted to a factors object, activitiesfactorstrain, with levels corresponding to the 6 descriptions in activity_labels.txt. subject_train.txt is stored in subjettrain and consists of 7352 obs. of  1 variable representing the applicable subject volunteer in the test group. cbind is used to bind data from these 3 data frames into a new object, mergedtraindata.
4. mergedtestdata and mergedtraindata are merged into a single dataframe object, mergedData, which is replaced with a subset of extracted measurements on the mean and standard deviation for each measurement.
5. From the dataset in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is created and stored in a text filed called "tidydataset" saved to your working directory.
