## Peer-graded Assignment: Getting and Cleaning Data Course Project

The R script ```run_analysis.R``` performs the following:

1. Download the ```UCI HAR Dataset.zip``` file from the provided link and unzips the file in the working directory
2. Load the activity labels file (```activity_labels.txt```)
3. Load the features file(```features.txt```), extracts only the mean and standard deviation measurements, and fixes the names of the features
4. Load the training dataset (subject, activities) and selects only the desired features from the collection of measurements
5. Load the test dataset (subject, activities) and selects only the desired features from the collection of measurements
6. Merge the training and test datasets, and assign descriptive column names to the columns
7. Convert the ```activity``` column into factors
8. Create the a tidy dataset (```tidydata.txt```) with the average of each variable for each activity and each subject
