# getdata-033-project
Getting and Cleaning Data (033) Course Project 

## Candice, October 20, 2015

*README.md description: This README.md explains the purpose of the scripts and markdown files contained in this repo and how they are connected.*

### CodeBook.md description: 
The CodeBook.md is a markdown file within this repo that clearly describes the data sources, data variables, references, and any transformations that I performed to download and clean up the source data used during this project. 

### run_analysis.R description: 
The run_analysis.R script within this repo uses data linked to the course website. The linked data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. This run_analysis.R script was built to download, clean and tidy the data. The output is a tidy data set called "tidydata.txt". This R script includes a brief description of the data and the data souce, but mainly details the downloading, merging and transformation of the data.

### This run_analysis.R script was built to download and clean the data and ultimately does the following: 
### The R script built to get and clean this data is called run_analysis.R and does the following: 
1. All of the relevant data files were read into data frames and appropriate column headers were added. The data were last downloaded on Thursday, October 22, 2015. 
2. The training and test sets were combined into a single data set.
2a. Duplicate columns were removed as they were not needed in the final dataset.
3. All feature columns were selected that contained the strings "mean()" or "std()". 
4. The activity column was converted from a integer to a factor, inserting descriptive labels that describe the activities.
5. The column variables were appropriately labeled with descriptive variable names, by removing capitalization; relabeling abbreviations to full text and removing untidy data usage of "-" & "," & "()".
6. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 86 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.
7. The tidy data set was output to a .txt file, created with write.table() using row.name=FALSE 

