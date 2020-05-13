library(dplyr)

unzip (zipfile= "./Dataset.zip", exdir ="./data")  #create new folder in working directory called data with the unzipped UCI HAR Dataset in it
#list.files("./data", recursive = TRUE)  #shows all the files in the Dataset, important are train, test

#to read the data
pathtodata = file.path ("./data", "UCI HAR Dataset") #make a filepath to the UCI HAR Dataset (less typing)
#read train-data
pathtodataTr <- file.path (pathtodata, "train") #make a filepath to data Tr(ain)
xtrain <- read.table (file.path (pathtodataTr, "X_train.txt"), header = FALSE)
ytrain <- read.table (file.path (pathtodataTr, "y_train.txt"), header = FALSE)
subjecttrain <- read.table (file.path(pathtodataTr, "subject_train.txt"), header = FALSE)
#read test-data
pathtodataTe <- file.path (pathtodata, "test")
xtest <- read.table (file.path (pathtodataTe, "X_test.txt"), header = FALSE)
ytest <- read.table (file.path(pathtodataTe, "y_test.txt"), header = FALSE)
subjecttest <- read.table (file.path (pathtodataTe, "subject_test.txt"), header = FALSE)
#read features-data
features <- read.table (file.path(pathtodata, "features.txt"))
#read activity_labels-data
activitylabels <- read.table (file.path(pathtodata, "activity_labels.txt"))

#column names
colnames(xtrain) <- features[,2] #columns of xtrain and xtest are names of features-column 2 = descriptive variable names
colnames(xtest) <- features [,2]
colnames(ytrain) <- "activity_id"
colnames(ytest) <- "activity_id"
colnames(subjecttrain) <- "subject_number"
colnames(subjecttest) <- "subject_number"
colnames(activitylabels) <- c("activity_id", "activity_type")

#merging
merge_train <- bind_cols(subjecttrain, ytrain, xtrain)
merge_test <- bind_cols(subjecttest, ytest, xtest)
merge_all <- bind_rows(merge_train, merge_test)

#extract all columns with mean and standard deviation
colNames <- colnames(merge_all)  #less typing in next step because all of the grepl-functions will need 'colnames(merge_all)'
mean_sd <- (grepl("activity_id", colNames) | grepl("subject_number", colNames) | grepl("mean..", colNames) | grepl("std..", colNames))
dat <- merge_all[,mean_sd == TRUE]

#give activity-names to dataset dat
dat_by_activity <- full_join(dat, activitylabels, by = "activity_id")

#tidy dataset with average for each activity and each subject
tidy_data <- aggregate(formula = .~subject_number + activity_id, data = dat_by_activity[1:81], FUN = mean)#take mean depending on subject_number and activity_id of col 1:81(col 82 = activity_type)
tidy_data <- tidy_data[order(tidy_data$subject_number, tidy_data$activity_id),]
tidy_data_by_activity_name <- full_join (activitylabels, tidy_data, by = "activity_id")

write.table(tidy_data_by_activity_name, "tidy_data.txt", row.name=FALSE) # write a text file
