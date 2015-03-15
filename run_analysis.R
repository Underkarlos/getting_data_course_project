# Gathering all the data
x_train_sub <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

x_test_sub <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

features <- read.table("features.txt")
act_labels <- read.table("activity_labels.txt")

#Setting up the complete data frame
datosx <- rbind (x_train, x_test)
features2 <- as.character(features$V2) #Getting the name of the columns
colnames(datosx) <- features2

dataxmean <- datosx[ , grepl( "mean()" , names( datosx ) ) ] #Subsetting by column names
dataxstd <- datosx[ , grepl( "std()" , names( datosx ) ) ]
datosx <- cbind(dataxmean, dataxstd)

subj_x <- rbind(x_train_sub, x_test_sub)
datosx <- cbind(subj_x, datosx)

datosy <- rbind (y_train, y_test)
colnames(datosy) <- "Activity"

for (i in 1:length(datosy$Activity)) {
        datosy[i,"Activity_Name"] <- act_labels[datosy[i,1],2]
}

datos <- cbind(datosy, datosx) 
datos$Activity <- NULL
names(datos)[names(datos)=="V1"] <- "Subject"

final_data <- aggregate(. ~ Activity_Name + Subject ,data = datos,FUN=function(x) mean(x))