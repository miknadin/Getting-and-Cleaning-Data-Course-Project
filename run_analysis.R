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

txt_mean <- Data_X[grep("mean()", names(Data_X), fixed = TRUE)]
txt_std <- Data_X[grep("std()", names(Data_X), fixed = TRUE)]
txt <- cbind(txt_mean, txt_std, Data_X[,562:563])
names(txt)[67] <- "label_activity"
names(txt)[68] <- "object"

txt$activity[txt$label_activity == 1] <- "walking"           #step 3
txt$activity[txt$label_activity == 2] <- "walking upstairs"
txt$activity[txt$label_activity == 3] <- "walking downstairs"
txt$activity[txt$label_activity == 4] <- "sitting"
txt$activity[txt$label_activity == 5] <- "staying"
txt$activity[txt$label_activity == 6] <- "laying"

df <- data.frame()
df <- aggregate(x = txt[,1:66], FUN = "mean", by = list(txt$activity, txt$object))

names(df)[1] <- "activity"
names(df)[2] <- "object"

write.table(df, file = "step5.txt", row.name=FALSE)

data <- read.table("./step5.txt", header = TRUE)

