## run_analysis.R
## for Course Project, Week 3 of Cleaning and Getting Data
## Candice, October 20, 2015

# run_analysis.R description: This script uses data as directed by a weblink on the course website. 
# The data link represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
# 
# Data description: Human Activity Recognition database built from the recordings of 30 
# subjects performing activities of daily living (ADL) while carrying a waist-mounted 
# smartphone with embedded inertial sensors.
#  
# A full description is available in the CodeBook.md associated with this script, or at the 
# site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Here are the data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This R script is called run_analysis.R and does the following: 

# 1. Downloads and loads the data into a local R workspace.
# 1a. Setting local directory:
localdir<-getwd()       # saves the local directory address
setwd(localdir)         # sets the work space to match the local address
getwd()                 # checks the above is true
# setwd("~/Coursera/Data Science Specialization/3_Getting_CleaningData/CourseProject") # pre-set working directory

# 1b. Check to see if i) raw Samsung and ii) working data storage directories exist 
## in the local directory,if FALSE, create them:
if (!file.exists("Samsungdata")) {dir.create("Samsungdata")}
if (!file.exists("data")) {dir.create("data")}
list.files("./")      # Check to ensure folder is created

# 1c. Downloading zip file from the internet:
## Checking to see if data has already been downloaded. If yes, continue, if no, download.
if (file.exists("./Samsungdata/samsung.zip")) {
        print("Samsung data available") 
}       else {
        print("Downloading and unzipping Samsung data...")
        Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(Url, destfile = "./Samsungdata/samsung.zip", mode = "wb")
        dateDownloaded <- date()
        list.files("./Samsungdata")
        # 1d. Unzipping data file and storing it in a working data directory.
        unzip("./Samsungdata/samsung.zip", exdir = "./data")
        list.files("./data")
        name<-as.character(list.files("./data"))
        ## Rename the folder to be simple:
        file.rename("./data/UCI HAR Dataset", "./data/dataset")    
}

# 1d. Loading the data sets into an R workspace:
## Check to see if raw data is present by confirming 1c. above. If TRUE, continue.
if (file.exists("./Samsungdata/samsung.zip")) {
        print("Samsung data available") 
}       else {
        stop("!!!Still need Samsung data!!!")
}

# 1e. Loading the files into R workspace
## using activity_labels.txt for activity names (rows)
activities <- "./data/dataset/activity_labels.txt"
## using feature.txt for measurement field names (columns)
measurements <- "./data/dataset/features.txt"

## reading column and row data into variables:
action_labels <- read.table(activities, sep = " ", header = F, stringsAsFactors = F)
measure_labels <- read.table(measurements, sep = " ", header = F)

## Loading raw data for the test and training data sets
testSub<-read.table("./data/dataset/test/subject_test.txt")
testY<-read.table("./data/dataset/test/Y_test.txt")
testX<-read.table("./data/dataset/test/X_test.txt")

trainX<-read.table("./data/dataset/train/X_train.txt")
trainY<-read.table("./data/dataset/train/Y_train.txt")
trainSub<-read.table("./data/dataset/train/subject_train.txt")

## renaming data sets columns
test<-testSub
colnames(test)<-"SubjectID"; colnames(testY)<-"Activity"; colnames(testX)<-measure_labels[,2]
train<-trainSub
colnames(train)<-"SubjectID"; colnames(trainY)<-"Activity"; colnames(trainX)<-measure_labels[,2]

## creating a data source field to differentiate between the different source data (test/train) 
## as a good data practice before merging
##loading the plyr and dplyr libraries
library(plyr); library(dplyr)
collength1<- as.numeric(length(testSub[,])); collength2<- as.numeric(length(trainSub[,]))
sourcetest <- data.frame(matrix("", nrow=as.numeric(collength1),ncol=1))
colnames(sourcetest)<-"DataSourceID"; sourcetest$DataSourceID = "test"
sourcetrain <- data.frame(matrix("", nrow=as.numeric(collength2),ncol=1))
colnames(sourcetrain)<-"DataSourceID"; sourcetrain$DataSourceID = "train"

# 2. Merging the training and the test sets to create one data set.
testset <- cbind(sourcetest, test, testY, testX); 
trainset <- cbind(sourcetrain, train, trainY, trainX)
data<-rbind(testset, trainset)
## removing duplicate columns that are not needed for final dataset: 
data <- data[ !duplicated(names(data)) ]
## cleaning environment of no-longer-needed files
rm(test, testSub, testY, testX, train, trainSub, trainY, trainX, 
   measure_labels, sourcetest, sourcetrain, testset, trainset)

# 3. Extracting only the measurements on the mean and standard deviation for each measurement. 
newdata <- select(data, 1:3, contains("mean"), contains("std"))

# 4. Using descriptive activity names to name the activities in the data set
newdata$Activity <- action_labels$V2[newdata$Activity]

# 5. Appropriately labeling the data set with descriptive variable names. 
# 5a. Removing the capilized lettering in the column names
names(newdata) <- tolower(names(newdata))
# 5b. Relabeling abbreviations in column names to full text and removing 
## untidy data usage of "-" & "," & "()"
names(newdata) = gsub("-","",names(newdata)); names(newdata) = gsub("\\(","",names(newdata)); 
names(newdata) = gsub("\\)","",names(newdata)); names(newdata) = gsub("\\,","",names(newdata))
names(newdata) = gsub("std","standarddeviation",names(newdata)); names(newdata) = gsub("acc","acceleration",names(newdata))
names(newdata) = gsub("mag","magnitude",names(newdata)); names(newdata) = gsub("freq","frequency",names(newdata))
names(newdata)<-gsub("Gyro", "Gyroscope", names(newdata))
## remove datasource row that is no longer needed (actually never was but it is
## good practice to know source for each row)
newdata <- select(newdata,-1)

# 6. From the data set in step 5, createing a second, independent tidy data set with the 
## average of each variable for each activity and each subject.i.e. for each of the 30 
## subjects, there are all 6 activities and the mean of their variable values, meaning that 
## the final data frame has 30*6=180 rows.
tdata<-aggregate(. ~subjectid + activity, newdata, mean)
tdata<-tdata[order(tdata$subjectid,tdata$activity),]

## The deliverable is a text file that contains the average value for each unique combination 
## of subject together with activity together with features. 
write.table(tdata, file = "./data/tidydata.txt",row.name=FALSE)
## Cleaning the local environment of intermediate data
rm(action_labels, newdata, data, activities, collength2, collength1, measurements)

# Submitting to Coursera
## Please upload your data set as a txt file created with write.table() using 
## row.name=FALSE (do not cut and paste a dataset directly into the text box, 
## as this may cause errors saving your submission).

