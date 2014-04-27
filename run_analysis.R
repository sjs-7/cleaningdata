# set up environment
library(reshape2)

# read in general information data
names_activity = read.table(paste(getwd(), '/UCI HAR Dataset/activity_labels.txt', sep=""), stringsAsFactors = FALSE, header = FALSE)
names_features = read.table(paste(getwd(), '/UCI HAR Dataset/features.txt', sep=""), header = FALSE)
loc_sumdata = c(grep("mean()", names_features[,2]), grep("std()", names_features[,2]))

########### TEST DATA SET

# create test data set from subject information and measurements
subject_test = read.table(paste(getwd(), '/UCI HAR Dataset/test/subject_test.txt', sep=""), col.names = "subject", header = FALSE)
x_test = read.table(paste(getwd(), '/UCI HAR Dataset/test/X_test.txt', sep=""), col.names = names_features[,2], header = FALSE)
test_data = data.frame(subject_test, x_test[,loc_sumdata])

# create activity data column from activity labels and y_test
y_test = read.table(paste(getwd(), '/UCI HAR Dataset/test/y_test.txt', sep=""), header = FALSE, col.names = "activity")
for (i in 1:nrow(names_activity))
{
  y_test[y_test[,1] == i,] = names_activity[i,2]
} 

# combine activity information with test data and subject information
test_data = data.frame(test_data, y_test)

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# reshape data by subject and activty and compute mean on each subject/activity combination
test_sumdata = dcast(melt(test_data, id = c("subject","activity")), formula = subject + activity ~ variable, fun.aggregate = mean)


########### TRAIN DATA SET

# create train data set from subject information and measurements
subject_train = read.table(paste(getwd(), '/UCI HAR Dataset/train/subject_train.txt', sep=""), col.names = "subject", header = FALSE)
x_train = read.table(paste(getwd(), '/UCI HAR Dataset/train/X_train.txt', sep=""), col.names = names_features[,2], header = FALSE)
train_data = data.frame(subject_train, x_train[,loc_sumdata])

# create activity data column from activity labels and y_train
y_train = read.table(paste(getwd(), '/UCI HAR Dataset/train/y_train.txt', sep=""), header = FALSE, col.names = "activity")
for (i in 1:nrow(names_activity))
{
  y_train[y_train[,1] == i,] = names_activity[i,2]
} 

# combine activity information with train data and subject information
train_data = data.frame(train_data, y_train)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# reshape data by subject and activty and compute mean on each subject/activity combination
train_sumdata = dcast(melt(train_data, id = c("subject","activity")), formula = subject + activity ~ variable, fun.aggregate = mean)

# Create .txt summaries of tidy data sets
write.table(test_data, file="test_data.txt", sep=" ", append = FALSE)
write.table(test_sumdata, file="test_data.txt", sep=" ", append = FALSE)
write.table(train_data, file="train_data.txt", sep=" ", append = FALSE)
write.table(train_sumdata, file="train_data.txt", sep=" ", append = FALSE)
