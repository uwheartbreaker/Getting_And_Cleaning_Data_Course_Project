#Getting & Cleaning Data Course Project Codebook

The data represents information collected from accelerometers in the Samsung Galaxy S smartphone in experiments performed by the UCI Machine Learning Repository.  Please refer to the following link for further detail on how the data was captured: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

###Required Downloads:
Please download the following zip file:
 * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###How the run_analysis.R File Works
 1.  The program begins by loading the files contained in the zip file into data tables.  These files consist of training tables, testing tables & the corresponding headers for these files (i.e. features & labels).
 2.  Once I have loaded the files, I rename the column labels to my tables so that they correspond to the data they represent.
 3.  I then merge the training labels table with the training sets table filtering to only include measurements on mean & standard deviation.
 4.  Step 3 is repeated on the data in the test folder.
 5.  Next I combine the training & testing tables in one file which called combine_data.
 6.  I reformat the column names to give them titles that more appropriately classify what the data is measuring.
 7.  Finally I create an independent tidy data set, run_analysis, that grabs the average of each variable by activity & subject.

###Data Outputs
  * combine_data: Combined data file of the training & test sets
  * run_analysis: Average of each variable for each activity & every subject
