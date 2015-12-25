library(dplyr)

#pull in 'test' files
xtest <- read.table("X_test.txt")
ytest <- read.table("Y_test.txt")
subtest <- read.table("subject_test.txt")
xtest$label <- ytest$V1
xtest$sub <- subtest$V1

#pull in 'training' files
xtrain <- read.table("X_train.txt")
ytrain <- read.table("Y_train.txt")
subtrain <- read.table("subject_train.txt")
xtrain$label <- ytrain$V1
xtrain$sub <- subtrain$V1

#combine test and training for a full dataset
combined <- rbind(xtest,xtrain)

#pull in feature names for accurate naming
features <- read.table("features.txt")
names_list <- features$V2
names_list <- as.character(names_list)
names(combined) <- c(names_list,"label","subject")

#find the mean and std variables in order to extract these into new dataframe
meanstdindex <- c(grep("mean()",names_list,fixed=TRUE),
                  grep("std()",names_list,fixed=TRUE))

names_list <- names_list[meanstdindex]
meanstddf <- combined[,c(meanstdindex,562,563)]
activitylabels <- read.table("activity_labels.txt",
                             col.names=c("label","ActivityName"))

#use descriptive names for activities
meanstddf <- inner_join(meanstddf,activitylabels,by="label")

#rename variables for more descriptive variable names
varnames <- names(meanstddf)
varnames <- gsub("^[t]","Time",varnames)
varnames <- gsub("^[f]","Frequency",varnames)
varnames <- gsub("BodyBody","Body",varnames)
varnames <- gsub("Acc","Acceleration",varnames)
varnames <- gsub("Mag","Magnitude",varnames)
varnames <- gsub("Gyro","Gyroscope",varnames)
names(meanstddf) <- varnames

#group by subject and activity and find average measure
grouped <- meanstddf %>% group_by(subject,ActivityName) %>%
  summarize_each(funs(mean))

grouped <- data.frame(grouped)
grouped <- select(grouped,-label)

#write tidy dataset
write.table(grouped,file="tidy_data.txt")