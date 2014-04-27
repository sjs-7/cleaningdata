README
========================================================

This document contains the information on the scripts required to trainsform the data and how they are connected. 

Please refer to the codebook.md which contains decriptions on the variables, the data and all transformations that were performed to clean up the data.

========================================================

run_analysis creates the tidy data sets for both the training and test data sets contained in UCI HAR Data set file. 

run_analysis assumes that the reshape2 package is installed on the computer running the script. 

run_analysis assumes that the unzipped directory UCI HAR Dataset is contained in the working directory

run_analysis assumes that the data directory has not been altered.

========================================================

The data in the UCI HAR Dataset is transformed with only one script: run_analysis.R. This script does the following:

1) set up environment by loading library
2) reads in general information data pertaining to both test and train data

3) creates test data set from subject information and measurements
4) create activity data column from activity labels and y_test
5) combines activity information with test data and subject information
6) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
7) repeats steps 3-6 for train data set

8) Create .txt summaries of tidy data sets
