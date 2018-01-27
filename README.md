## Peer-graded Assignment: Getting and Cleaning Data Course Project

The R script ```run_analysis.R``` performs the following:

1. Downloads the ```UCI HAR Dataset.zip``` file from the provided link and unzips the file in the working directory
2. Loads the activity labels file (```activity_labels.txt```)
3. Loads the features file (```features.txt```), extracts only the mean and standard deviation measurements, and fixes the names of the features
4. Loads the training dataset (```subject_train.txt```, ```y_train.txt```) and selects only the desired features from the collection of measurements (```X_train.txt```)
5. Loads the test dataset (```subject_test.txt```, ```y_test.txt```) and selects only the desired features from the collection of measurements (```X_test.txt```)
6. Merges the training and test datasets, and assigns descriptive column names to the columns
7. Converts the ```activity``` column into factors
8. Creates the a tidy dataset (```tidydata.txt```) with the average of each variable for each activity and each subject
