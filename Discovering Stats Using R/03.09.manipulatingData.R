### 3.9.1. selecting parts of a dataframe
lecturePersonality <- lectureData[, c("friends", "alcohol", "neurotic")]
lecturePersonality
names(lecturePersonality)
str(lecturePersonality)
summary(lecturePersonality)

lectureData["job"]
lectureData[3]
lectureData[["job"]]
lectureData[[3]]
# http://www.r-tutor.com/r-introduction/data-frame/data-frame-column-slice
# https://stackoverflow.com/questions/1169456/the-difference-between-and-notations-for-accessing-the-elements-of-a-lis
job == "Lecturer"
lectureData[job == "Lecturer"]
lectureData[job == "Lecturer",]
lectureData[,job == "Lecturer"]

job[6] <- "Lecturer"
job == "Lecturer"
lectureData[job == "Lecturer"]
job[6] <- "Student"
job == "Lecturer"
lectureData[job == "Lecturer"]

lectureOnly <- lectureData[job == "Lecturer",]
lectureOnly

alcoholPersonality <- lectureData[alcohol > 10, c("friends", "alcohol", "neurotic")]
alcoholPersonality


### 3.9.2. selecting data with the subset() function
lectureData
lectureOnly2 <- subset(lectureData, job == "Lecturer")
lectureOnly2
alcoholPersonality2 <- subset(lectureData, alcohol > 10,
                              select = c("friends", "alcohol", "neurotic"))
alcoholPersonality2
alcoholPersonality3 <- subset(lectureData, alcohol > 10,
                              select = c(friends:neurotic))
alcoholPersonality3
alcoholPersonality4 <- subset(lectureData, alcohol > 10,
                              select = c(friends, alcohol, neurotic))
alcoholPersonality4

# https://www.r-bloggers.com/r-101-the-subset-function/
numvec = c(2,5,8,9,0,6,7,8,4,5,7,11)
charvec = c("David","James","Sara","Tim","Pierre",
            "Janice","Sara","Priya","Keith","Mark",
            "Apple","Sara")
gender = c("M","M","F","M","M","M","F","F","F","M","M","F")
state = c("CO","KS","CA","IA","MO","FL","CA","CO","FL","CA","WY","AZ")

subset(numvec, numvec > 7)
subset(numvec, numvec < 9 & numvec > 4)
subset(numvec, numvec < 3 | numvec > 9)

df <- data.frame(var1 = numvec, var2 = charvec, var3 = gender, var4 = state)
df
subset(df, var1 < 5)
subset(df, var2 == "Sara")
subset(df, var1 == 5, select = c(var2, var4))
subset(df, var2 != "Sara" & gender == "F" & var1 > 5)


### 3.9.3. dataframes and matrices
# matrix can contain only numeric values
alcoholPersonality
alcoholPersonalityMatrix <- as.matrix(alcoholPersonality); alcoholPersonalityMatrix

alcoholPersonality3
alcoholPersonalityMatrix2 <- as.matrix(lectureData[alcohol > 10,
                                                   c(4:7)])
alcoholPersonalityMatrix2


### 3.9.4. reshaping data
satisfactionData <- read.delim("Honeymoon Period.dat", header = TRUE)
str(satisfactionData)
dim(satisfactionData)
ncol(satisfactionData)
nrow(satisfactionData)
names(satisfactionData)
summary(satisfactionData)
head(satisfactionData)
View(satisfactionData)

satisfactionData
subset(satisfactionData, Person == 1, select = c(2:5))


satisfactionStacked <- stack(satisfactionData, select = c(2:5))
str(satisfactionStacked)
satisfactionStacked
attach(satisfactionData)
satisfactionData[order(Person, Gender),c(1, 6, 2:5)]

satisfactionUnstacked <- unstack(satisfactionStacked)
str(satisfactionUnstacked)
satisfactionUnstacked
satisfactionUnstacked2 <- unstack(satisfactionStacked, values ~ ind)
str(satisfactionUnstacked2)
satisfactionUnstacked2

install.packages("reshape")
library(reshape)

restructuredData <- melt(satisfactionData, id = c(1, 6), measure.vars = c(2:5))
str(restructuredData)
head(restructuredData, 20)
widedata <- cast(restructuredData, Person + Gender ~ variable, value = "value")
head(widedata, 20)

# http://seananderson.ca/2013/10/19/reshape.html
install.packages("reshape2")
library(reshape2)
restructuredData2 <- reshape2::melt(satisfactionData, id = c(1,6), measure.vars = c(2:5))
head(restructuredData2, 20)
