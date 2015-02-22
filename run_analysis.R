run_analysis <- function() {


	if(require("plyr")){
		print("plyr is loaded correctly")
	} else {
		print("trying to install plyr")
		install.packages("plyr")
		if(require(plyr)){
			print("plyr installed and loaded")
		} else {
			stop("could not install plyr package")
		}
	}


	dataPath <- file.path(".","UCI HAR Dataset", fsep = .Platform$file.sep)
	if (!file.exists(dataPath)) {
		stop("The data is not in the './UCI HAR Dataset' folder")
	}
	
	trainData <- file.path(dataPath,"train", fsep = .Platform$file.sep)
	if (!file.exists(dataPath)) {
		stop("There is no './UCI HAR Dataset/train' sub folder")
	}
	
	testData <- file.path(dataPath,"test", fsep = .Platform$file.sep)
	if (!file.exists(dataPath)) {
		stop("There is no './UCI HAR Dataset/test' sub folder")
	}
	
	## Import the file features.txt containing the column names of the measurement files
	## The data frame is transformed in a vector to be used as col.names when importing both data sets
	ColNamesF <- file.path(dataPath,"features.txt", fsep = .Platform$file.sep)
	measureFileColNames <- read.table(ColNamesF, header=FALSE, row.names=1, colClasses="character", col.names=c("id","ColNames"))
	colNamesVector <- measureFileColNames[,"ColNames"]

	## combine files to create data set 1 (test)
	testDatasubjectF <- file.path(testData,"subject_test.txt", fsep = .Platform$file.sep)
	testDataactivityF <- file.path(testData,"y_test.txt", fsep = .Platform$file.sep)
	testDatameasureF <- file.path(testData,"X_test.txt", fsep = .Platform$file.sep)

	testDatasubjectlist <- read.table(testDatasubjectF, header=FALSE, col.names="Subject")
	testDataactivitylist <- read.table(testDataactivityF, header=FALSE, col.names="ActivityName")

	## not happy with the transformation of colNamesVector as column headers: char "-()" converted to dots
	testDatameasures <- read.table(testDatameasureF, header=FALSE, col.names=colNamesVector)

	testDataSet <- cbind(testDataactivitylist,testDatasubjectlist,testDatameasures)

	## combine files to create data set 2 (train)
	trainDatasubjectF <- file.path(trainData,"subject_train.txt", fsep = .Platform$file.sep)
	trainDataactivityF <- file.path(trainData,"y_train.txt", fsep = .Platform$file.sep)
	trainDatameasureF <- file.path(trainData,"X_train.txt", fsep = .Platform$file.sep)

	trainDatasubjectlist <- read.table(trainDatasubjectF, header=FALSE, col.names="Subject")
	trainDataactivitylist <- read.table(trainDataactivityF, header=FALSE, col.names="ActivityName")

	## not happy with the transformation of colNamesVector as column headers: char "-()" converted to dots
	trainDatameasures <- read.table(trainDatameasureF, header=FALSE, col.names=colNamesVector)

	trainDataSet <- cbind(trainDataactivitylist,trainDatasubjectlist,trainDatameasures)
	
	
	## Merge the 2 sets of data (train & test) to create one data set
	fullDataSet <- rbind(testDataSet,trainDataSet)


	## Extract measurements on the mean and standard deviation for each measurement
	## using grepl to get only the columns named Subject, ActivityName or containing the sequence .mean.. or .std.. in their name
	mergedData<-fullDataSet[grepl("Subject|ActivityName|[[:punct:]]mean[[:punct:]]{2}|[[:punct:]]std[[:punct:]]{2}", names(fullDataSet))]



	## Replace activity code with descriptive name
		## load the activity labels file and transform it into a vector
		activityCodesF <- file.path(dataPath,"activity_labels.txt", fsep = .Platform$file.sep)
		activityCodes <- read.table(activityCodesF, header=FALSE, as.is=TRUE, col.names=c("id","activity"))
		actCodeVector <- activityCodes[,"activity"]
		## use the vector to replace the code with the name
		mergedData$ActivityName <- actCodeVector[mergedData$ActivityName]



	## Label the data set with descriptive variable name
		## done in the previous operations

	## Export Merged Data Set
    write.table(mergedData, file="./mergedDataset.txt", row.names=FALSE)


	## Create tidy data set with average of each variable for each activity & subject
	tidyData <- ddply(mergedData, .(ActivityName,Subject), numcolwise(mean))


	## Export Tidy Data Set
	write.table(tidyData, file="./tidyDataset.txt", row.names=FALSE)
	
	return(tidyData)
}