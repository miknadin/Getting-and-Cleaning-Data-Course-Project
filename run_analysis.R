setwd("D:\\Coursera\\Getting and Cleaning Data\\data")
install.packages("data.table")
library(data.table) 

Data_X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", 
                          header = F, na.strings ="", stringsAsFactors= F)
Data_X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", 
                          header = F, na.strings ="", stringsAsFactors= F)

Data_Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep = "", 
                          header = F, na.strings ="", stringsAsFactors= F)
Data_Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep = "", 
                          header = F, na.strings ="", stringsAsFactors= F)

Data_X <- rbind(Data_X_train, Data_X_test) 


names_Data_X <- read.table("./UCI HAR Dataset/features.txt", sep = "", 
                           header = F, na.strings ="", stringsAsFactors= F)
names(Data_X) <- names_Data_X[,2]        

Data_Y <- rbind(Data_Y_train, Data_Y_test)
Data_X <- cbind(Data_X, Data_Y) 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", 
                     header = F, na.strings ="", stringsAsFactors= F)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", 
                            header = F, na.strings ="", stringsAsFactors= F)

subject <- rbind(subject_train, subject_test)
Data_X <- cbind(Data_X, subject)

