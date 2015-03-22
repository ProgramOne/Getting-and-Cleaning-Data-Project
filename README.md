# Getting-and-Cleaning-Data-Project
 
The script run_analysis.R performs the 5 steps.
1. Merges the training and the test sets to create one data set. Data is merged with rbind() function.
2. Extracts only the measurements on the mean and standard deviation for each measurement. Data is extracted
using grep function and subsetting.
3. Uses descriptive activity names to name the activities in the data set. Activity names have been assigned
from activity_labels.txt
4. Appropriately labels the data set with descriptive variable names. Additional column names have been assigned.
5. From the data set in step 4, creates a second, independent tidy data set with the average of
each variable for each activity and each subject. New dataset has been generated using ddply() function and
saved as a .txt file format.
