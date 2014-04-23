### How to use the run_analysis.R script on the UCI HAR Dataset
First, sownload the UCI HAR dataset and unzip it into your working directory 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) 

After sourcing the run_analysis.R file you will have access to the run_analysis() function.

run_anlaysis takes no parameters and does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The final result is a run_anlaysis.txt file of the independent tidy data set with the average of each variable for each activity and each subject.

See CodeBook for detailed descriptions of variables and transformations