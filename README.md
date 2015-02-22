# getdata-project

* 

This repository contains the files for the Coursera Getting and Cleaning Data course project.

	1. run_analysis.R : a script used to transform the original data set
	2. CodeBook.md : a markdown file describing the original data set and the two files obtained after running the script.




## Using the run_analysis.R script

The R script run_analysis.R is used to merge the train and test source data sets in order to obtain two new files :
	- mergedDataset.txt
	- tidyDataset.txt
	
The script must be placed in your working directory.
The script assumes that the source data is in a folder named  "./UCI HAR Dataset" within your working directory.
The script uses the plyr library to create the tidy data set. If not present on your system, it will be installed.

### 


It first reconstructs each data set from the three source files in the "./UCI HAR Dataset/test" and "./UCI HAR Dataset/train" folders.
It uses the "./UCI HAR Dataset/features.txt" file to put readable names on the measurement data set columns.

Once the training data set and the test data set are merged by the script, we subset only the columns containing the measurements mean and standard deviation for each row.

The activity codes are replaced by their descriptive activity names using the "./UCI HAR Dataset/activity_labels.txt" file.

The merged data set is written with its header in the mergedDataset.txt file using write.table() standard separator (sep = " ") 

The merged data set is summarized into a tidy data set keeping only the average of each measurements for each activity and subject.

The resulting data set contains the same 68 columns but only 180 rows (30 subjects * 6 activities)

It is then written with its header in the tidyDataset.txt file using write.table() standard separator (sep = " ") 



## Output of the script

The run_analysis.R script returns the tidy data set. The data set files are saved in the working directory.
