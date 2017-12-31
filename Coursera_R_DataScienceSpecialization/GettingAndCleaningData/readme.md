## Getting and Cleaning Data Course Project

### Introduction:

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set for *Getting and Cleaning Data* course Project from Coursera. The goal is to prepare tidy data that can be used for later analysis in the course. 

### Requirement:

Following are the requirement description as given in the course project.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Based on this create a R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement.

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive variable names.

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Objects:

This utility has following objects in folder and a short description about them.

| File Name | Type | Description |
| --- | --- | --- |
| Input | Folder | Input data for the project is downloaded to this folder |
| Output | Folder | The output tidy data set will be stored in this folder |
| download_file.R | R | R script to create the Input/Output folders and download/unzip the input files to Input folder |
| run_analysis.R | R | R script that does the data cleaning, tranformation and generates output tidy data file |
| readme.md | Markdown | Documentation |
| codebook.md | Markdown | Documentation that describes the steps applied to get the tidy data set |


### How to run this project:

Following are the sequence of steps to run,

* Ensure that latest R version is installed in your machine. If not download and install it from <https://cran.r-project.org/> 

* Install the “dplyr” R package

* Copy and run the scripts present in download_file.R 

* Copy and run the scripts present in run_analysis.R 



