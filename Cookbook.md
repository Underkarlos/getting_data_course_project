#Getting and Cleaning Data Course Project Cookbook

##Data used
The data used for this project is the one generated by the Human Activity Recognition Using Smartphones Dataset research and its variables have not been changed in name.

##Data transformation
In order to achieve the goal of the project (a tidy dataset with the average values for the measures of means and standard deviations, grouped by activity and subject of study) a number of transformations had to be done. The guide for this transformation follows:

1. The initial data was extracted from the original files, in order to have it all arranged in data frames ready to be used by R. There's a total of 8 data frames created, regarding the test and train values, subjects of study for test and trial data, the features measured in tests and trials and the activities being performed while the measuring was taking place.
2. An initial semi-complete data frame is created, putting together the data from the tests and trial measures.
3. According to the "features" measured, the columns of that semi-complete data frame are named after those features.
4. Two auxiliar data frames are created, each one being a subset of the previous one: one containing the data with the columns that have "means" and the other one, with the columns that have "standard deviations". Both of them are combined in one data frame.
5. Now the last data frame created is formatted correctly. This is adding the activities performed by the subjects while measuring and the subjects of study. Final formatting is required, being that deleting the activities indexes column (since the names are already in the data frame) and identifying the subjects column with a proper name.
6. A final data frame is created, aggregating the data: first performing a mean calculation of all variables and then grouping them by activity and subject of study.
7. The "final_data" data frame is a 180 rows (6 activities x 30 subjects) x 81 columns (Activity Name, Subject and 79 variables containing "mean" or "std") data frame.