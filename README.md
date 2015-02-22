# getdata-project
	*Contributor : Frederic Grenier (mitienka)* 

This repository contains the following files for the Coursera Getting and Cleaning Data course project.

	1. run_analysis.R : a script used to transform the original data set. Returns a tidy data set.
	2. CodeBook.md : a markdown file describing the original data set and the two files obtained after running the script.




## Using the run_analysis.R script

The R script run_analysis.R is used to merge the train and test source data sets in order to obtain two new files :
	- mergedDataset.txt
	- tidyDataset.txt
	
The script must be placed in your working directory.
The script assumes that the source data is in a folder named  "./UCI HAR Dataset" within your working directory.
The script uses the plyr library to create the tidy data set. If not present on your system, it will be installed.

The script was used on a Windows 64-bits platform with R version 3.1.2

The script will return the tidy data set after saving it to file.

### How the script works

run_analysis.R performs the following operations:

1. It first reconstructs each data set from the three source files in the "./UCI HAR Dataset/test" and "./UCI HAR Dataset/train" folders.
It uses the "./UCI HAR Dataset/features.txt" file to put readable names on the measurement data set columns.

2. It merges the training data set and the test data set.

3. It subsets only the columns containing the measurements mean and standard deviation for each row using a grep on the row names.

4. It replaces the activity codes by their descriptive activity names using the "./UCI HAR Dataset/activity_labels.txt" file.

5. It writes the merged data set with its header in the mergedDataset.txt file using write.table() standard separator (sep = " ") 

6. It summarizes the merged data set into a tidy data set keeping only the average of each measurements for each activity and subject.

7. It writes the tidy data set with its header in the tidyDataset.txt file using write.table() standard separator (sep = " ") 

8. Returns the tidy data set in a data frame.



## Output of the script

The run_analysis.R script returns the tidy data set. The data set files are saved in the working directory.
