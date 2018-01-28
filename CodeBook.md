## Peer-graded Assignment: Getting and Cleaning Data Course Project

### Description of the Data Set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Transformations Performed on the Data Set

The R script ```run_analysis.R``` performs the following:

1. Downloads the ```UCI HAR Dataset.zip``` file from the provided link and unzips the file in the working directory
2. Loads the activity labels file (```activity_labels.txt```)
3. Loads the features file (```features.txt```), extracts only the mean and standard deviation measurements, and fixes the names of the features
4. Loads the training dataset (```subject_train.txt```, ```y_train.txt```) and selects only the desired features from the collection of measurements (```X_train.txt```)
5. Loads the test dataset (```subject_test.txt```, ```y_test.txt```) and selects only the desired features from the collection of measurements (```X_test.txt```)
6. Merges the training and test datasets, and assigns descriptive column names to the columns
7. Converts the ```activity``` column into factors
8. Creates the a tidy dataset (```tidydata.txt```) with the average of each variable for each activity and each subject

### Variables of the Tidy Data Set

1. ```subject``` - subject who performed the activity for each window sample (ranges from 1 to 30)
2. ```activity``` - type of activity performed when the corresponding measurements were taken
   * ```WALKING```
   * ```WALKING_UPSTAIRS```
   * ```WALKING_DOWNSTAIRS```
   * ```SITTING```
   * ```STANDING```
   * ```LAYING```
3. Features from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ (mean value and standard deviation)
   * ```tBodyAcc-XYZ```
   * ```tGravityAcc-XYZ```
   * ```tBodyAccJerk-XYZ```
   * ```tBodyGyro-XYZ```
   * ```tBodyGyroJerk-XYZ```
   * ```tBodyAccMag```
   * ```tGravityAccMag```
   * ```tBodyAccJerkMag```
   * ```tBodyGyroMag```
   * ```tBodyGyroJerkMag```
   * ```fBodyAcc-XYZ```
   * ```fBodyAccJerk-XYZ```
   * ```fBodyGyro-XYZ```
   * ```fBodyAccMag```
   * ```fBodyAccJerkMag```
   * ```fBodyGyroMag```
   * ```fBodyGyroJerkMag```