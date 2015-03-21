## add code to load required libraries
packages <- c("data.table", "dplyr")

##ensures that the necessary packages are loaded 
sapply(packages, require, character.only = TRUE, quietly = TRUE)

## Read activity Labels
print("Read Activiry Labels")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Read featues name list
print("Read Feature names")
feature_names <- read.table("UCI HAR Dataset/features.txt")

## feature name contains characters like ( ) - , which are not allowed as valid characters in names, specially as column names
## so lets get rid of these, else it causes issue in 'select' function call to subset the data with duplicate column error
## Also ommiting multiple dots from new names created
## E.g 'tBodyAcc-mean()-X'  is renamed to 'tBodyAcc.mean.X'
valid_feature_names <- sub("\\.\\.", "", make.names(names=feature_names$V2, unique=TRUE, allow_ = TRUE))


#####################################
## Read test data set into variables
#####################################
print("Read test data")
## Read test data and set the column names to the feature_names
test_data <- read.table("UCI HAR Dataset//test//X_test.txt", sep="")
names(test_data) <- valid_feature_names
print("dim: test data") 
print(dim(test_data))

## read test activity data and name the column as 'activity'
test_activity <- read.table("UCI HAR Dataset//test//y_test.txt")
names(test_activity) <- "activity"
print("dim: test activity")
print(dim(test_activity))

## read test subject data and name the column as 'subject'
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(test_subject) <- "subject"
print("dim: test subject")
print(dim(test_subject))


##########################
## Read training Data
##########################
print("Read Training data")
## Read training data
train_data <- read.table("UCI HAR Dataset//train//X_train.txt", sep="")
names(train_data) <- valid_feature_names
print("dim: training data")
print(dim(train_data))

## read train activity data and name the column as 'activity'
train_activity <- read.table("UCI HAR Dataset//train//y_train.txt")
names(train_activity) <- 'activity'
print("dim: training activity")
print(dim(train_activity))

## read train subject data data and name the column as 'subject'
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(train_subject) <- "subject"
print("dim: training subject")
print(dim(train_subject))

###############################################################################################################
##Bind the subject, activity and data tables columnwise to create a single table with all the columns together
## Do this for both test and training data
## With this the table will have columns 'subject', 'activity' and 561 columns after that
###############################################################################################################
print("Merge cbind the columns for both test and train data")
test_set <- cbind(test_subject, test_activity, test_data)

train_set <- cbind(train_subject, train_activity, train_data)

############################## Merge Training and Test Data sets now #########################
## Now bind the two sets with rbind function to have single table with all the columns and
## total rows = sum of rows in test and train table
#############################################################################################
print("Merge the test and training table with rbind")
total_set <- rbind(test_set, train_set)

#############################################################################
## subset the table to only include columns those reflect mean or Standard 
## deviation measurements
############################################################################
## first get the column index from the valid_feature_names
print("Extract all column those have 'mean' or 'Mean' or 'std' in its name")
column_index <- grep("mean|Mean|std", names(total_set))
print("No. of columns being extracted:")
print(length(column_index))

## Subset test data to have only columns those have mean, Mean or std in their name 
## then set the activity column to label values instead of id 
## then group by  subject and activity
## then summarize for calculating mean for each field, excluding grouping variables
print("Get Tidy data")
print("Subset test data to have only columns those have mean, Mean or std in their name")
print("mutate the 'activity' column, replace the numeric values with corresponding activity names")
print("Group the data by 'subject' and 'activity' columns")
print("At last summarize each column to calculate mean for each activity for each subject")
tidy_data <- select(total_set, c(1, 2, column_index)) %>% mutate(activity = activity_labels$V2[activity]) %>% group_by(subject, activity) %>% summarise_each(funs(mean))

print("Tidy data dimensions:")
print(dim(tidy_data))
print("Tidy data class:")
print(class(tidy_data))

########################################################
## Write to file 
########################################################
print("Write tidy data to a file 'tidydata.txt")
write.table(tidy_data, "tidydata.txt", row.names = FALSE)

