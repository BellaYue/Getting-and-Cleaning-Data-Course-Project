setwd("~/")

# 1. Merges the training and the testing sets to create one data set

## 1) download and unzip the zip file from the course website
if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/projectData.zip")
listzip <- unzip("./data/projectData.zip", exdir = "./data")

### marked the download date
### > dateDownloaded <- date()
### > dateDownloaded
### [1] "Fri May  5 11:41:37 2017"

## 2) load data into R, and rename the column names of lable files and subject files
## "X_.txt" is data files, "y_.txt" is lable file, and "subject_.txt" is subject file
trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
colnames(trainy) <- c("activity")
trainsubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
colnames(trainsubject) <- c("subject")
testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
colnames(testy) <- c("activity")
testsubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
colnames(testsubject) <- c("subject")

## 3) merge the training and testing data
train <- cbind(trainsubject, trainy, trainx)
test <- cbind(testsubject, testy, testx)
alldata <- rbind(train, test)

# -----------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement

## 1) load the feature names of the features.txt file into R: 
features <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]

## 2) extract eman and standard deviation of each measurements from the alldata
featureindex <- grep(("mean\\(\\)|std\\(\\)"), features)
newdata <- alldata[, c(1,2, featureindex)]
colnames(newdata) <- c("subject", "activity", features[featureindex])

# -----------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set

##  1) Reading activity labels:
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

## 2) replace the numberID (1-6) of newdata$activity with activity names
newdata$activity <- factor(newdata$activity, levels = activity[,1], labels = activity[,2])

# -----------------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names

names(newdata)<-gsub("^t", "time", names(newdata))
names(newdata)<-gsub("^f", "frequency", names(newdata))
names(newdata)<-gsub("BodyBody", "Body", names(newdata))
names(newdata) <- gsub("-mean", "Mean", names(newdata))
names(newdata) <- gsub("-std", "Std", names(newdata))
names(newdata) <- gsub("\\()", "", names(newdata))
names(newdata) <- gsub("-", "", names(newdata))

# -----------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject

library(plyr)
averdata <- aggregate(. ~subject + activity, newdata, mean)
averdata <- averdata[order(averdata$subject,averdata$activity),]
write.csv(averdata, "./data/tidydata.csv", row.names=FALSE)
