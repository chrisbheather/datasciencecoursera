

run_analysis<-function (){
    
    if(!file.exists("UCI HAR Dataset")){
        stop("UCI HAR Dataset not found")
    }
    
    #only selecting columns that represent mean() and std()
    features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
    colNames <- as.character(features[,2])
    # strings for selected column names
    colStr<-grep("(mean..|std..)$",colNames, value=TRUE)
    #removes ending parentheses
    colStr<-gsub("[()]","",colStr)
    #indexes for selected columns
    colInd<-grep("(mean..|std..)$",colNames)
    
    #get test data
    X_test<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
    #subset only selected columns
    X_testSub<-X_test[,colInd]
    colnames(X_testSub)<-colStr
    
    #get test subjects
    subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names=c("Subject"))
    
    #get test activities and convert them to factors
    activityTest<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names=c("Activity"))
    activityTest[,1]<-factor(activityTest[,1], labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
    
    finalTest <-data.frame(subjectTest,activityTest,X_testSub)
    
    #get train data
    X_train<-read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
    #subset only selected columns
    X_trainSub<-X_train[,colInd]
    colnames(X_trainSub)<-colStr
    print(colnames(X_trainSub))
    #get train subjects
    subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names=c("Subject"))
    
    #get test activities and convert them to factors
    activityTrain<-read.table("./UCI HAR Dataset/train/y_train.txt",  header=FALSE, col.names=c("Activity"))
    activityTrain[,1]<-factor(activityTrain[,1], labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
    
    finalTrain<-data.frame(subjectTrain,activityTrain,X_trainSub)
    
    #merging train and test data into a final DF
    finalDF <- rbind(finalTest,finalTrain)

    
    #Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
    molten<-melt(finalDF, id = c("Subject", "Activity"))
    resultDF<-dcast(molten, Subject + Activity ~ variable, mean)
    
    write.table(resultDF, "run_analysis.txt")
}

