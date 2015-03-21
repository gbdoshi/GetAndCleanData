#README

Place **run_analysis.R** script inside folder at same level were you have your data extracted from zip file. Its along side where **'UCI HAR Dataset'** folder is.

Run the script. It perofrms following tasks  

- Reads Activity Labels from activity_labels.txt file

- Reads list of features from features.txt file

- Reads X_test.txt file from inside test folder to get the raw data for test subjects

- Reads y_test.txt file to get the list of activities for test 

- Reads subject_test.txt file to get the list of subject 

- Similarly raw data, activity list and subject list is read from training folder

- Subject, Activity and raw data for each of test and training are merged by column binding the tables

- Merges both the test and training data together to get one single table by row binding the test and training data table

- Subsets is obtained with only column names having **'mean', 'Mean', 'std'** in their name retained along with 'subject' and 'activity' field

- Mutates data, replacing the numerice value in activity column with corresponding activity labels

- Groups the data first by **subject** and then by **activity** column

- Summarises each columns to calculate **mean by each subject & each activity**

- Finally writes the data into **tidydata.txt** file 
