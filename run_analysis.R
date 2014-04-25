# 0. chargement des fichiers test et train
library(data.table)
testData <- read.table("test/X_test.txt",header=FALSE) ##lecture de x_test.txt
testData_act <- read.table("test/y_test.txt",header=FALSE) ##lecture de y_test.txt
testData_sub <- read.table("test/subject_test.txt",header=FALSE)
trainData <- read.table("train/X_train.txt",header=FALSE)
trainData_act <- read.table("train/y_train.txt",header=FALSE)
trainData_sub <- read.table("train/subject_train.txt",header=FALSE)

# 3. utilisation du fichier du description des activités pour créer les activités du fichier
activities <- read.table("activity_labels.txt",header=FALSE,colClasses="character")
testData_act$V1 <- factor(testData_act$V1,levels=activities$V1,labels=activities$V2)
trainData_act$V1 <- factor(trainData_act$V1,levels=activities$V1,labels=activities$V2)

# 4. Affectation à chaque colonne du bon nom de colonne
features <- read.table("features.txt",header=FALSE,colClasses="character")
colnames(testData)<-features$V2
colnames(trainData)<-features$V2
colnames(testData_act)<-c("Activity")
colnames(trainData_act)<-c("Activity")
colnames(testData_sub)<-c("Subject")
colnames(trainData_sub)<-c("Subject")

# 1. fusion des deux fichiers train et test dans un seul fichier bigdata
testData<-cbind(testData,testData_act)
testData<-cbind(testData,testData_sub)
trainData<-cbind(trainData,trainData_act)
trainData<-cbind(trainData,trainData_sub)
bigdata<-rbind(testData,trainData)

# 2. extraction de la moyenne et de l'écart type
s<-subset(bigdata,select=-c(Activity)) ##subset bigdata sans "Activity" pour calculer la moyenen de toutes les colonnes
bigdata_mean<-sapply(s,mean,na.rm=TRUE)
bigdata_sd<-sapply(bigdata,sd,na.rm=TRUE)

# 5. création d'un second fichier indépendant tidy qui contient la moyenne et l'éacrt type en fonction de l'activité Activity et de chaque sujet Subject
DT <- data.table(bigdata)
tidy<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy.txt")
