testData <- read.table(file = "test/X_test.txt", header = FALSE)
testAct <- read.table(file="test/y_test.txt")
testSub <- read.table(file="test/subject_test.txt")
testData <- cbind(testData,testAct,testSub)
trainData <- read.table(file = "train/X_train.txt", header = FALSE)
trainAct <- read.table(file="train/y_train.txt")
trainSub <- read.table(file="train/subject_train.txt")
trainData <- cbind(trainData,trainAct,trainSub)
#merging observations
completeData <- rbind(testData,trainData)
#cleaning
rm(testData)
rm(trainData)
#finding observation to subset and adding feature names
features <- read.table(file="features.txt")
intfeat <- c( 1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,242:429,503:504,516:517,529:530,542:543,
   562,563 )
names <- features$V2
colnames(completeData) <- names
names(completeData)[249] <- 'activity'
names(completeData)[250] <- 'subject'
rm(features)
#subsetting them and creating final output
completeData<-completeData[,intfeat]
completeData[,250] <- as.factor(completeData[,250])
completeData[,249] <- factor(completeData[,249], levels = c(1:6),labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING",
                                                                       "LAYING"))
final <- aggregate(completeData[,1:248], by = c(list(completeData[,249]),list(completeData[,250])), mean)
#cleaning
names(final)[1] <- 'Activity'
names(final)[2] <- 'Subject'
rm(completeData)
write.table(x = final,file = "output.txt",row.names = FALSE)