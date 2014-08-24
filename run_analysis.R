setwd("C:/Study/Coursera/DataScience/Getting and Cleaning Data/Project")
featuresdat <- read.table("data/features.txt")
features <- featuresdat[, 2]
activities_labels <- read.table("data/activity_labels.txt")
train_labels <- read.table("data/train/y_train.txt")
test_labels <- read.table("data/test/y_test.txt")
all_labels <- rbind(train_labels, test_labels)
# Read the subject id file
train_subject_id <- read.table("data/train/subject_train.txt")
test_subject_id <- read.table("data/test/subject_test.txt")
all_subject_id <- rbind(train_subject_id, test_subject_id)
# Read the measurement files
train_measure <- read.table("data/train/X_train.txt")
test_measure <-read.table("data/test/X_test.txt")
total_measure <- rbind(train_measure, test_measure)
# Assign the variable names in measurement data set 
names(total_measure) <- features
# find the mean and standrad deviation for each measurement
s1 <- grep("mean", features)
s2 <- grep("Mean", features)
s3 <- grep("std", features)
s <- sort(c(s1, s2, s3))
# Subset the data for mean and standard deviation
dat <- total_measure[, s]
dat1 <- cbind(all_labels, dat)
names(dat1)[1] <- "Activity_ID"
# Export the data set
write.table(dat1, "MeanStd.txt", row.names = FALSE)
