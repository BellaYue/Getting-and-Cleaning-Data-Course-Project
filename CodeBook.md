Code Book
=========

This is a code book, which will describe the data used in this course
project.In addition, a summary describeing the transformation that I
performed to clean up the data.

Original Data
-------------

-   [Original
    data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
-   [Original description of the data
    set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw data of this project represent data collected from the
accelerometers from the Samsung Galaxy S smartphone. 30 volunteers
performed 6 different activities while wearing a smartphone. The
smartphone captured various data about their movements.

The original data set includes both the raw sampled data (folder
../Inertial Signals) and features apparently based on the raw data. In
this project, the analysis only focuses on the features, not the raw
data. Therefore, the data files in (folder ../Inertial Signals) were
ignored.

Raw Data in this project
------------------------

There are 3 types of the data files in this project. 
-    X: rows of features measurements 
     -   X_train.txt: 7352 obs. of 561 features, 21 of 30 volunteers 
     
     -   X_test.txt: 2947 obs. of 561 features, 9 of 30 volunteers

-   y: the activity labels corresponding to each row of X. Encoded
    as numbers.
    -   y\_train.txt: a vector of 7352 integers

    -   y\_test.txt: a vector of 2947 intergers

-   subject: an identifier of the subject who carried out the
    experiment, on which each row of X was measured. Encoded as numbers.
    -   subject\_train.txt: a vector of 7352 integers

    -   subject\_test.txt: a vector of 2947 intergers

In addition, the list of features and the activity labels are loaded
into the project. 
-   features.txt: names of the 561 features
-   activity_labels.txt: IDs and names of the 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Transformation
--------------

1.  All of the above data files were readed into data frames. Column
    headers were added, and the training and test sets were merged into
    one data set.
2.  The measurements on the mean "mean()" and standard deviation "std()"
    were extracted. 66 features were selected. Combined with subjectID
    and activity labels, 68 columns were remained.
3.  The descriptive activity names were used to name the activities in
    the data set.
4.  The original variable names were modified with descriptive
    variable names.
5.  A second, independent tidy data set was created with the average of
    each variable for each activity and each subject.There are 180 obs.
    of 68 variables.
6.  The tidy data set was output to a CSV file.
