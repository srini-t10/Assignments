## Getting and Cleaning Data Course Project

### Steps applied to generate tidy data set

Following are the sequence of steps to applied to generate the tidy data set,

*  Step 1. Load required packages

*  Step 2. 
   Read the input files.  
   (Pre-Requsite: Input files needs to be present under input folder. Refer to README.md for details).  
	* Step 2.1. Read the X test variables from features.txt and define Y/Subject variables   
    * Step 2.2. Clean up column names by applying following changes 
		  	  
		| Pattern in Column Name | Replaced With | Description |
		| --- | --- | --- |
		| () | Blank | Replace the special character"()" with blank |
		| - | _ | Replace - with _ |
		| t | Time | If column starts with t, then replace t as Time |
		| f | Frequency | If column starts with f, then replace f as Frequency |
		| Acc | Acceleration | Replace Acc as Acceleration |
		| Mag | Magnitude | Replace Mag as Magnitude |
	    
    * Step 2.3. Read activity labels
    * Step 2.4. Read the test data with variables defined in step 2 as col.names
    * Step 2.5. Read the training data with variables defined in step 2 as col.names
           
* Step 3. Merge test and train data
        
    * Step 3.1. Column bind test data
    * Step 3.2. Column bind train data
    * Step 3.3. Row bind test and train data
     
* Step 4. Limit to only the required columns.
      
    * Step 4.1. Find only the mean (or) std (or) Activity (or) Subject columns
    * Step 4.2 Update OneDataSet to contain only the required columns.
  
* Step 5. Merge Activity name to OneDataDet and return the Tidy Data set with the average of each variable for each activity and each subject
    
* Step 6. Write the Tidy Data to a text file.

### Column list in tidy data set Output file.

ActivityID
ActivityName
SubjectID
TimeBodyAcceleration_mean_X
TimeBodyAcceleration_mean_Y
TimeBodyAcceleration_mean_Z
TimeBodyAcceleration_std_X
TimeBodyAcceleration_std_Y
TimeBodyAcceleration_std_Z
TimeGravityAcceleration_mean_X
TimeGravityAcceleration_mean_Y
TimeGravityAcceleration_mean_Z
TimeGravityAcceleration_std_X
TimeGravityAcceleration_std_Y
TimeGravityAcceleration_std_Z
TimeBodyAccelerationJerk_mean_X
TimeBodyAccelerationJerk_mean_Y
TimeBodyAccelerationJerk_mean_Z
TimeBodyAccelerationJerk_std_X
TimeBodyAccelerationJerk_std_Y
TimeBodyAccelerationJerk_std_Z
TimeBodyGyro_mean_X
TimeBodyGyro_mean_Y
TimeBodyGyro_mean_Z
TimeBodyGyro_std_X
TimeBodyGyro_std_Y
TimeBodyGyro_std_Z
TimeBodyGyroJerk_mean_X
TimeBodyGyroJerk_mean_Y
TimeBodyGyroJerk_mean_Z
TimeBodyGyroJerk_std_X
TimeBodyGyroJerk_std_Y
TimeBodyGyroJerk_std_Z
TimeBodyAccelerationMagnitude_mean
TimeBodyAccelerationMagnitude_std
TimeGravityAccelerationMagnitude_mean
TimeGravityAccelerationMagnitude_std
TimeBodyAccelerationJerkMagnitude_mean
TimeBodyAccelerationJerkMagnitude_std
TimeBodyGyroMagnitude_mean
TimeBodyGyroMagnitude_std
TimeBodyGyroJerkMagnitude_mean
TimeBodyGyroJerkMagnitude_std
FrequencyBodyAcceleration_mean_X
FrequencyBodyAcceleration_mean_Y
FrequencyBodyAcceleration_mean_Z
FrequencyBodyAcceleration_std_X
FrequencyBodyAcceleration_std_Y
FrequencyBodyAcceleration_std_Z
FrequencyBodyAccelerationJerk_mean_X
FrequencyBodyAccelerationJerk_mean_Y
FrequencyBodyAccelerationJerk_mean_Z
FrequencyBodyAccelerationJerk_std_X
FrequencyBodyAccelerationJerk_std_Y
FrequencyBodyAccelerationJerk_std_Z
FrequencyBodyGyro_mean_X
FrequencyBodyGyro_mean_Y
FrequencyBodyGyro_mean_Z
FrequencyBodyGyro_std_X
FrequencyBodyGyro_std_Y
FrequencyBodyGyro_std_Z
FrequencyBodyAccelerationMagnitude_mean
FrequencyBodyAccelerationMagnitude_std
FrequencyBodyBodyAccelerationJerkMagnitude_mean
FrequencyBodyBodyAccelerationJerkMagnitude_std
FrequencyBodyBodyGyroMagnitude_mean
FrequencyBodyBodyGyroMagnitude_std
FrequencyBodyBodyGyroJerkMagnitude_mean
FrequencyBodyBodyGyroJerkMagnitude_std

	
### Appendix:

## Input Dataset Credit:

> **Human Activity Recognition Using Smartphones Dataset**
  **Version 1.0**

  Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
  Smartlab - Non Linear Complex Systems Laboratory
  DITEN - Università degli Studi di Genova.
  Via Opera Pia 11A, I-16145, Genoa, Italy.
  activityrecognition@smartlab.ws
  www.smartlab.ws

>> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**For each record it is provided:**
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


**Feature Selection in input data set:**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a 
constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean



