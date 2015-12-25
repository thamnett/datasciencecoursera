Code Book 
=================

The variables selected for this database are summary variables from UCI HAR Dataset.
The selected variables include subjects, activities, and  the measurements on the mean and standard deviation for each measurement from the UCI HAR Dataset.
Each record in the dataset represents an average measurement for each subject and activity in the dataset (six activities for each of 30 subjects).

Time domain signals use prefix 'time' to denote time, while frequency domain signals are denoted by the prefix 'freq'.
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAcceleration-XYZ
timeGravityAcceleration-XYZ
timeBodyAccelerationJerk-XYZ
timeBodyGyroscope-XYZ
timeBodyGyroscopeJerk-XYZ
timeBodyAccelerationMagnitude
timeGravityAccelerationMagnitude
timeBodyAccelerationJerkMagnitude
timeBodyGyroscopeMagnitude
timeBodyGyroscopeJerkMagnitude
freqimeBodyAcceleration-XYZ
freqBodyAccelerationJerk-XYZ
freqBodyGyroscope-XYZ
freqBodyAccelerationMagnitude
freqBodyAccelerationJerkMagnitude
freqBodyGyroscopeMagnitude
freqBodyGyroscopeJerkMagnitude

The set of variables selected from the UCI HAR Dataset are: 

mean(): Mean value
std(): Standard deviation

The complete list of original UCI HAR Dataset variables of each feature vector is available in 'features.txt'
