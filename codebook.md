# CodeBook.md file for Course Project, Week 3 of Cleaning and Getting Data
## Candice, October 20, 2015

*CodeBook.md description: A code book that describes the variables, data, and any transformations that I performed to clean up the data and provide a tidy data set.*

## Data: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

### A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
### Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Source Experiment and Data Set Information: Human Activity Recognition Using Smartphones Dataset, Version 1.0 (taken from reference [1])
### Authors:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:
For each record in the dataset it is provided:
1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope.
3. A 561-feature vector with time and frequency domain variables.
4. Its activity label.
5. An identifier of the subject who carried out the experiment. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

Signals were used to estimate variables of the feature vector for each pattern: '*_[XYZ]$' is used to denote 3-axial signals in the X, Y and Z directions.

### The dataset includes the following source files:
1. 'README.txt'
2. 'features_info.txt': Shows information about the variables used on the feature vector.
3. 'features.txt': Lists the names of the 561 features.
4. 'activity_labels.txt': Lists the class labels with their activity name for each of the 6 activities.
5. 'train/X_train.txt': A training set of 7352 observations of the 561 features, for 21 of the 30 volunteers.
6. 'train/y_train.txt': A training set vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
7. 'test/X_test.txt': A test set of 2947 observations of the 561 features, for 9 of the 30 volunteers.
8. 'test/y_test.txt': A test set vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt
9. 'test/inertial Signals' and 'train/inertial Signals': These folders contain raw signal data files. Therefore, these raw files were ignored, as they were not needed within the scope of this project. 

### Dataset Variables selected for this project
Variables within the tidy data set are as examined as follows (taken from reference [1]).
1. The activity labels consist of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
2. The subjects who carried out the experiment are represented as a number from 1 to 30.
3. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
4. For each measurement the mean, stddev, and mean frequency were calculated.

### The R script built to download, clean and transform this data is called run_analysis.R and does the following: 
1. All of the relevant data files were read into data frames and appropriate column headers were added. The data were last downloaded on Thursday, October 22, 2015 

2. The training and test sets were combined into a single data set.

- The following duplicated columns were removed as they were not needed in the final dataset:
fBodyAcc-bandsEnergy()-1,8, fBodyAcc-bandsEnergy()-9,16, fBodyAcc-bandsEnergy()-17,24, fBodyAcc-bandsEnergy()-25,32, fBodyAcc-bandsEnergy()-33,40,         fBodyAcc-bandsEnergy()-41,48, fBodyAcc-bandsEnergy()-49,56, fBodyAcc-bandsEnergy()-57,64, fBodyAcc-bandsEnergy()-1,16, fBodyAcc-bandsEnergy()-17,32, fBodyAcc-bandsEnergy()-33,48, fBodyAcc-bandsEnergy()-49,64, fBodyAcc-bandsEnergy()-1,24, fBodyAcc-bandsEnergy()-25,48, fBodyAcc-bandsEnergy()-1,8, fBodyAcc-bandsEnergy()-9,16, fBodyAcc-bandsEnergy()-17,24, fBodyAcc-bandsEnergy()-25,32, fBodyAcc-bandsEnergy()-33,40, fBodyAcc-bandsEnergy()-41,48, fBodyAcc-bandsEnergy()-49,56, fBodyAcc-bandsEnergy()-57,64, fBodyAcc-bandsEnergy()-1,16, fBodyAcc-bandsEnergy()-17,32, fBodyAcc-bandsEnergy()-33,48, fBodyAcc-bandsEnergy()-49,64, fBodyAcc-bandsEnergy()-1,24, fBodyAcc-bandsEnergy()-25,48, fBodyAccJerk-bandsEnergy()-1,8, fBodyAccJerk-bandsEnergy()-9,16, fBodyAccJerk-bandsEnergy()-17,24, fBodyAccJerk-bandsEnergy()-25,32,

3. All feature columns were selected thatcontained the strings "mean()" or "std()". This resulted in 88 feature columns, including the subjectID and activity columns 

4. The activity column was converted from a integer to a factor, inserting descriptive labels that describe the activities

5. The column variables were appropriately labeled with descriptive variable names, by:
- Removing the capitalized lettering in the column names
- Relabeling abbreviations in column names to full text and removing untidy data usage of "-" & "," & "()"
Abbreviation examples are:
"std" = "standarddeviation"
"acc" = "acceleration"
"mag" = "magnitude"
"freq" = "frequency"
"Gyro" = "Gyroscope"

6. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 86 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.

The tidy data set was output to a .txt file, created with write.table() using row.name=FALSE 

### The output file from the run_analysis.R script is called "tidydata.txt", and has the following variables:
[1] "subjectid";[2] "activity"; [3] "tbodyaccelerationmeanx"; [4] "tbodyaccelerationmeany"; 
[5] "tbodyaccelerationmeanz"; [6] "tgravityaccelerationmeanx"; [7] "tgravityaccelerationmeany"; [8] "tgravityaccelerationmeanz"; [9] "tbodyaccelerationjerkmeanx"; 
[10]  "tbodyaccelerationjerkmeany"; [11] "tbodyaccelerationjerkmeanz"; [12] "tbodygyromeanx"; 
[13] "tbodygyromeany";[14] "tbodygyromeanz";[15] "tbodygyrojerkmeanx"; 
[16] "tbodygyrojerkmeany"; [17] "tbodygyrojerkmeanz"; [18] "tbodyaccelerationmagnitudemean"; 
[19] "tgravityaccelerationmagnitudemean"; [20] "tbodyaccelerationjerkmagnitudemean"; 
[21] "tbodygyromagnitudemean"; [22] "tbodygyrojerkmagnitudemean"; [23] "fbodyaccelerationmeanx"; [24] "fbodyaccelerationmeany"; [25] "fbodyaccelerationmeanz"; 
[26] "fbodyaccelerationmeanfrequencyx"; [27] "fbodyaccelerationmeanfrequencyy"; 
[28] "fbodyaccelerationmeanfrequencyz"; [29] "fbodyaccelerationjerkmeanx";
[30] "fbodyaccelerationjerkmeany"; [31] "fbodyaccelerationjerkmeanz";
[32] "fbodyaccelerationjerkmeanfrequencyx";[33] "fbodyaccelerationjerkmeanfrequencyy"; 
[34] "fbodyaccelerationjerkmeanfrequencyz"; [35] "fbodygyromeanx"; [36] "fbodygyromeany"; 
[37] "fbodygyromeanz"; [38] "fbodygyromeanfrequencyx"; [39] "fbodygyromeanfrequencyy"; 
[40] "fbodygyromeanfrequencyz"; [41] "fbodyaccelerationmagnitudemean"; 
[42] "fbodyaccelerationmagnitudemeanfrequency"; [43] "fbodybodyaccelerationjerkmagnitudemean"; [44] "fbodybodyaccelerationjerkmagnitudemeanfrequency"; [45] "fbodybodygyromagnitudemean"; 
[46] "fbodybodygyromagnitudemeanfrequency"; [47] "fbodybodygyrojerkmagnitudemean"; 
[48] "fbodybodygyrojerkmagnitudemeanfrequency"; [49] "angletbodyaccelerationmeangravity"; 
[50] "angletbodyaccelerationjerkmeangravitymean"; [51] "angletbodygyromeangravitymean"; 
[52] "angletbodygyrojerkmeangravitymean"; [53] "anglexgravitymean"; [54] "angleygravitymean"; [55] "anglezgravitymean"; [56] "tbodyaccelerationstandarddeviationx"; 
[57] "tbodyaccelerationstandarddeviationy"; [58] "tbodyaccelerationstandarddeviationz"; 
[59] "tgravityaccelerationstandarddeviationx"; [60] "tgravityaccelerationstandarddeviationy"; [61] "tgravityaccelerationstandarddeviationz"; [62] "tbodyaccelerationjerkstandarddeviationx"; [63] "tbodyaccelerationjerkstandarddeviationy"; [64] "tbodyaccelerationjerkstandarddeviationz"; [65] "tbodygyrostandarddeviationx"; [66] "tbodygyrostandarddeviationy"; 
[67] "tbodygyrostandarddeviationz"; [68] "tbodygyrojerkstandarddeviationx";  
[69] "tbodygyrojerkstandarddeviationy"; [70] "tbodygyrojerkstandarddeviationz"; 
[71] "tbodyaccelerationmagnitudestandarddeviation"; 
[72] "tgravityaccelerationmagnitudestandarddeviation"; 
[73] "tbodyaccelerationjerkmagnitudestandarddeviation";  
[74] "tbodygyromagnitudestandarddeviation"; [75] "tbodygyrojerkmagnitudestandarddeviation"; [76] "fbodyaccelerationstandarddeviationx"; [77] "fbodyaccelerationstandarddeviationy"; 
[78] "fbodyaccelerationstandarddeviationz"; [79] "fbodyaccelerationjerkstandarddeviationx"; [80] "fbodyaccelerationjerkstandarddeviationy"; [81] "fbodyaccelerationjerkstandarddeviationz"; [82] "fbodygyrostandarddeviationx"; [83] "fbodygyrostandarddeviationy"; 
[84] "fbodygyrostandarddeviationz"; [85] "fbodyaccelerationmagnitudestandarddeviation"; 
[86] "fbodybodyaccelerationjerkmagnitudestandarddeviation"; 
[87] "fbodybodygyromagnitudestandarddeviation"; 
[88] "fbodybodygyrojerkmagnitudestandarddeviation"; 

### The reformatted data represents a tidy data set in the following way:
1. There is one variable per column (2 columns of subject indicators and activity labels plus 86 columns of measures).
2. There is a single observation per row. I.e. This tidy data set contains a single subject and single activity with a summary of the means for all the measurement collected for that particular set on a single row.
3. The table hold elements of only one kind. This is an improvement over the original data set provided in that the data are in a single table instead of multiple. 
4. Column names are easy to use and informative, avoiding white space, periods, and underscores in names, with abbreviations spelt out.
5. Variable values are internally consistent in that the same processes were applied to all variables in this tidy data table.

### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

[2] UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[3] R Development Core Team (2008). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. ISBN 3-900051-07-0, URL http://www.R-project.org.