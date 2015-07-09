# Getting-and-Cleaning-Data-Course-Project

-Author: miknadin
-Date:
 
-The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
-
#-Creating the tidy datafile
1. Download the data
2. Unzip the data
3. Set working directory
4. Read tables test/X_test.txt, train/X_train.txt, test/Y_test.txt, train/Y_train.txt
5. Bind tables X_test and X_train and get a table Data_X of 10299 rows and 561 columns
6. Set a names from the file features.txt as a names of variables if table Data_X 
7. Bind test/Y_test.txt, train/Y_train.txt and get a table of 10299 rows and 1 col (labels of activities)
8. Bind subject_train, subject_test and get a table of 10299 rows and 1 col (objects)
9. Bind tables of 7. and 8. and get a table Data_X 10299 rows and 563
-
-
-The tidy data
-
-    Each variable you measure should be in one column
-    Each different observation of that variable should be in a different row
-    There should be one table for each "kind" of variable
-    If you have multiple tables, they should include a column in the table that allows them to be linked
