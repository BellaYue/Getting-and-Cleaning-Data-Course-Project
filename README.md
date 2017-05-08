# Getting and Cleaning Data Course Project

## Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Steps to work on the course project
In this course project, you should create one R script called [**run_analysis.R**](https://github.com/BellaYue/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) that does the following:
  1. Gets and extracts data from the given url.
  2. Merges the training and the test sets to create one data set.
  3. Extracts only the measurements on the mean and standard deviation for each measurement.
  4. Uses descriptive activity names to name the activities in the data set
  5. Appropriately labels the data set with descriptive activity names.
  6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Note**: The R script requres the [*plyr* package](https://cran.r-project.org/web/packages/plyr/index.html) which can be downloaded from CRAN. 

**The output** of the R script is a tidy data set, [**tidydata.csv**](https://github.com/BellaYue/Getting-and-Cleaning-Data-Course-Project/blob/master/tidydata.csv).

You can read more about the data and the analysis in the [**code book**](https://github.com/BellaYue/Getting-and-Cleaning-Data-Course-Project/blob/master/CodeBook.md).
