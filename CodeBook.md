---
title: "Code Book tidy_data"
author: "Manu929"
date: "5/13/2020"
output: word_document
---

## Collection of the data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Meaning of column names

- activity_id: see next column 'activity_type'  
- activity_type: as described in the table itself  
- subject_number: id of each participant  

- tBodyAcc-XYZ: time domain signal of Body acceleration for x-, y- and z-axis  
- tGravityAcc-XYZ: time domain signal of Gravity acceleration for x-, y- and z-axis  
- tBodyAccJerk-XYZ: Jerk signal (Body linear acceleration der derived in time) for x-, y- and z-axis  
- tBodyGyro-XYZ: gyroscope signals for x-, y- and z-axis  
- tBodyGyroJerk-XYZ: Jerk signal (angular velocity derived in time) for x-, y- and z-axis  
- tBodyAccMag: magnitude of 3-dimensional signals of Acceleration using Euclidian norm  
- tGravityAccMag: magnitude of 3-dimensional signals of Gravity Acceleration using Euclidian norm  
- tBodyAccJerkMag: magnitude of 3-dimensonal Jerk signal of Body acceleration  
- tBodyGyroMag: magnitude of 3-dimensional signal of gyroscope  
- tBodyGyroJerkMag: magnitude of 3-dimensonal Jerk signal of angular velocity)  
- fBodyAcc-XYZ: Fast Fourier Transform (FFT) applied to Body acceleration in 3 Dimensions  
- fBodyAccJerk-XYZ: Fast Fourier Transform (FFT) applied to Body acceleration-Jerk in 3 Dimensions  
- fBodyGyro-XYZ: Fast Fourier Transform (FFT) applied to gyroscope signals in 3 Dimensions  
- fBodyAccMag: Fast Fourier Transform (FFT) applied to Body accelerations magnitude  
- fBodyAccJerkMag: Fast Fourier Transform (FFT) applied to magnitude of Body acceleration-Jerk  
- fBodyGyroMag: Fast Fourier Transform (FFT) applied to magnitude of gyroscope signal  
- fBodyGyroJerkMag: Fast Fourier Transform (FFT) applied to magnitude of gyroscope-Jerk signal  

The set of variables that were estimated from these signals are: 

- mean(): Mean value  
- std(): Standard deviation  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean  
- tBodyAccMean  
- tBodyAccJerkMean  
- tBodyGyroMean  
- tBodyGyroJerkMean  