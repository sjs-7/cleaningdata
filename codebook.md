Getting and Cleaning Data - GPS Data
========================================================

This document contains decriptions on the variables, the data and all transformations that were performed to clean up the data. 

Please refer to the README.md which contains the information on the scripts required to trainsform the data and how they are connected. 

## Variables
names_activity contains the names of the activity labels for the study

names_features contains the names for the data contained in the 

subject_test contains the subject ids for the train and test data.

x_test contains the measurement data extracted that pertain to mean or standard summaries. These are extracted by finding only columns that that contain mean() or std().

test_data is the data frame that contains all the information extracted from the test data files that pertains to mean measurements of standard measurements. It is created by column binding the names_features with the subject_test data frame and the x_test data frame. 

test_sumdata is the data frame that contains the means for each subject and each activity. This data frame is computed from the molten test data data frame by using the dcast function with an aggregate.fun = mean. 

## The Data

Data is extracted from the UCI HAR Dataset. The scripts assume that this data set is unzipped and located in the working directory. run_analysis.R will extract information on both the test and training data. The output from the script is as follows:

test_data: extracted measurements for the test data set that pertain to mean() or std() in the features list.

test_sumdata: summarized means for each subject's activity in test_data data frame.

train_data: extracted measurements for the train data set that pertain to mean() or std() in the features list.

train_sumdata: summarized means for each subject's activity in train_data data frame.

## The Transformations

Data is extracted from the text files by using the read.table function. The col.name parameter is used to name the column during data reading.  Individual data frames are than combined using cbind.
In order to compute the mean measurements that molten data frame of test_data and train_data need to me reshaped. This requires the reshape2 package. This is done using the melt function. The mean is than computed using dcast with an aggregate function. 

The final data sets are written to a table using the write.table function with sep=" "
