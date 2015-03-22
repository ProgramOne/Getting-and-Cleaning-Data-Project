library(plyr)

# Step 1 Merging the training and test sets to create one dataset

# Read train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Bind test and trin data
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Step 2 Extracting only the measurements on the mean and standard deviation for each measurement

# Read features
features <- read.table("UCI HAR Dataset/features.txt")

# Row numbers with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subsetting
x <- x[, mean_and_std_features]

# Assigning column names
names(x) <- features[mean_and_std_features, 2]

# Step 3 Using descriptive activity names to name the activities in the data set
# Read activities

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Assigning activity names
y[, 1] <- activities[y[, 1], 2]

# Assigning column name
names(y) <- "activity"

# Step 4 Labeling Data

# Assigning column name
names(subject) <- "subject"

# Binding  x,y and subject data
Data <- cbind(x, y, subject)

# Step 5
# Creation of independent tidy data set with the average of each variable

dataavg <- ddply(Data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(dataavg, "dataavg.txt", row.name=FALSE)
