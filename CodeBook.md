
# Data cleanup of the UCI Human Activity Recognition Dataset

The original data set was obtained from the University of California Irvine Center for Machine Learning and Intelligent Systems.
It contains a 'Human Activity Recognition database built from the recordings of 30 subjects performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist.'

Full description of this data set can be obtained here : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set can be downloaded here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data set is splitted into two parts, a training data set containing 70% of the measures (21 subjects) and a test data set containing the remaining 30% of the measures (9 subjects)


## Description of source data set

Once downloaded and un-zipped in your working directory, the data set contains the following files in a folder named "./UCI HAR dataset" :
	* 'README.txt'
	* 'features_info.txt': Shows information about the variables used on the feature vector.
	* 'features.txt': List of all features. It will be used to name the columns of the measures data set.
	* 'activity_labels.txt': Links the class labels with their activity name. It will be used to replace the activity labels by the name.
	* 'train/X_train.txt': Training data set measures.
	* 'train/y_train.txt': Training labels. Each row identifies the activity performed.
	* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
	* 'test/X_test.txt': Test data set measures. 
	* 'test/y_test.txt': Test labels. Each row identifies the activity performed.
	* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Data characteristics (summary of the README.txt and features_info.txt)
	* Features are normalized and bounded within [-1,1].
    * Each feature vector is a row on the text file.
	* Each row is a 561-feature vector with time and frequency domain variables.
    * The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
	* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
    * The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
    * A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
    * These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


## Data preparation

The R script run_analysis.R is used to merge the train and test source data sets in order to obtain two new files :
	* mergedDataset.txt
	* tidyDataset.txt
	
The script must be placed in your working directory.
The script assumes that the source data is in a folder named  "./UCI HAR Dataset" within your working directory.
The script uses the plyr library to create the tidy data set. If not present on your system, it will be installed.

It first reconstructs each data set from the three source files in the "./UCI HAR Dataset/test" and "./UCI HAR Dataset/train" folders.
It uses the "./UCI HAR Dataset/features.txt" file to put readable names on the measurement data set columns.

The run_analysis.R script does not return any values. The data set files are saved in the working directory.


### Merged data set (mergedDataset.txt)

Once the training data set and the test data set are merged by the script, we subset only the columns containing the measurements mean and standard deviation for each measurement.
The activity codes are replaced by their descriptive activity names using the "./UCI HAR Dataset/activity_labels.txt" file.

The resulting data set contains 68 columns:
		ActivityName : Identifies the activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
		Subject : Identifies the subject who performed the activity. Ranges from 1 to 30.
		tBodyAcc.mean...X
		tBodyAcc.mean...Y
		tBodyAcc.mean...Z
		tBodyAcc.std...X
		tBodyAcc.std...Y
		tBodyAcc.std...Z
		tGravityAcc.mean...X
		tGravityAcc.mean...Y
		tGravityAcc.mean...Z
		tGravityAcc.std...X
		tGravityAcc.std...Y
		tGravityAcc.std...Z
		tBodyAccJerk.mean...X
		tBodyAccJerk.mean...Y
		tBodyAccJerk.mean...Z
		tBodyAccJerk.std...X
		tBodyAccJerk.std...Y
		tBodyAccJerk.std...Z
		tBodyGyro.mean...X
		tBodyGyro.mean...Y
		tBodyGyro.mean...Z
		tBodyGyro.std...X
		tBodyGyro.std...Y
		tBodyGyro.std...Z
		tBodyGyroJerk.mean...X
		tBodyGyroJerk.mean...Y
		tBodyGyroJerk.mean...Z
		tBodyGyroJerk.std...X
		tBodyGyroJerk.std...Y
		tBodyGyroJerk.std...Z
		tBodyAccMag.mean..
		tBodyAccMag.std..
		tGravityAccMag.mean..
		tGravityAccMag.std..
		tBodyAccJerkMag.mean..
		tBodyAccJerkMag.std..
		tBodyGyroMag.mean..
		tBodyGyroMag.std..
		tBodyGyroJerkMag.mean..
		tBodyGyroJerkMag.std..
		fBodyAcc.mean...X
		fBodyAcc.mean...Y
		fBodyAcc.mean...Z
		fBodyAcc.std...X
		fBodyAcc.std...Y
		fBodyAcc.std...Z
		fBodyAccJerk.mean...X
		fBodyAccJerk.mean...Y
		fBodyAccJerk.mean...Z
		fBodyAccJerk.std...X
		fBodyAccJerk.std...Y
		fBodyAccJerk.std...Z
		fBodyGyro.mean...X
		fBodyGyro.mean...Y
		fBodyGyro.mean...Z
		fBodyGyro.std...X
		fBodyGyro.std...Y
		fBodyGyro.std...Z
		fBodyAccMag.mean..
		fBodyAccMag.std..
		fBodyBodyAccJerkMag.mean..
		fBodyBodyAccJerkMag.std..
		fBodyBodyGyroMag.mean..
		fBodyBodyGyroMag.std..
		fBodyBodyGyroJerkMag.mean..
		fBodyBodyGyroJerkMag.std..

The merged data set is written with its header in the mergedDataset.txt file using write.table() standard separator (sep = " ") 


### Tidy data set (tidyDataset.txt)

The merged data set is summarized into a tidy data set keeping only the average of each measurements for each activity and subject.

The resulting data set contains the same 68 columns but only 180 rows (30 subjects * 6 activities)

It is then written with its header in the tidyDataset.txt file using write.table() standard separator (sep = " ") 



# Licence
The original data set was gathered for the following publication [1] :
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
