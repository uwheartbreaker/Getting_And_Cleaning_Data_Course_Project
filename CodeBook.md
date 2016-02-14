#Getting & Cleaning Data Course Project Codebook

This codebook describes the variables, the data & any transformations performed to clean up the data in the run_analysis.R file.  The data comes from the UCI Machine Learning Repository.  For further reference please refer to: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

###Required Downloads:
Please download the following zip file:
 * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###How the run_analysis.R File Works
 1.  The file begins by loading the various files contained in the zip file.  These files consist of training tables, testing tables & the corresponding headers for these files (i.e. features & labels).
 2.  Once I have load the files, I rename the column labels to my tables so that they correspond to the data they represent.
 3.  I then merge the training labels with the training sets filtering to only include measuremnts on mean & standard deviation.
 4.  I then repeat Step 3 but this time on the data in the test folder.
 5.  Next I combine the training & tresting data measurements in one file which called combine_data.
 6.  I reformat the column names associated with the measurements giving them titles that more appropriately classify what the data is measuring.
 7.  Finally I create an independent tidy data set, run_analysis, that grabs the average of each variable by activity & subject on the combine_data.
 

###Data Outputs
  * combine_data: Combined data file of the training & test sets
  * run_analysis: Average of each variable for each activity & every subject
