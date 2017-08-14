rm(list = ls())

cwd <- "D:/!!!AllData!!!/GoodBooks/DiscoveringStatsUsingR/99.myScripts"
setwd(cwd); getwd()


### 3.5.1. creating variables
metallicaNames <- c("Lars", "James", "Kirk", "Rob"); metallicaNames
metallicaAges <- c(47, 47, 48, 46); metallicaAges


### 3.5.2. creating dataframes
metallica <- data.frame(Name = metallicaNames, Age = metallicaAges)
metallica
metallica$Name
metallica$Age

str(metallica)
table(metallica)
table(metallica$Name)
table(metallica$Age)

metallica$childAge <- c(12, 12, 4, 6)
metallica$childAge
metallica

names(metallica)

metallica2 <- list(metallicaNames, metallicaAges)
metallica2

metallica3 <- cbind(metallicaNames, metallicaAges)
metallica3


### 3.5.3. calculating new variables from existing ones
metallica$fatherhoodAge <- metallica$Age - metallica$childAge
metallica$fatherhoodAge
metallica
# https://github.com/hadley/adv-r/blob/master/Style.Rmd


### 3.5.4. organizing your data
### 3.5.4.1. creating a string variable
name <- c("Ben", "Martin", "Andy", "Paul", "Graham",
          "Carina", "Karina", "Doug", "Mark", "Zoe")
name

### 3.5.4.2. creating a date variable
birth_date <- as.Date(c("1997-07-03", "1969-05-24", "1973-06-21", "1970-06-16",
                        "1949-10-10", "1983-11-05", "1987-10-08", "1989-09-16",
                        "1973-05-20", "1984-11-12"))
birth_date

### 3.5.4.3. creating coding variables/factors
job <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2); job
job <- c(rep(1, 5), rep(2, 5)); job
job <- factor(job, levels = c(1:2), labels = c("Lecturer", "Student"))
job
levels(job)
levels(job) <- c("Medical Lecturer", "Medical Student")
job

job2 <- gl(2, 5, labels = c("Lecturer", "Student"))
job2

gl(2, 8, labels = c("Control", "Treat"))
gl(2, 1, 20)
gl(2, 2, 20)

### 3.5.4.4. creating a numeric variable
friends <- c(5, 2, 0, 4, 1, 10, 12, 15, 12, 17)
length(friends); friends

alcohol <- c(10, 15, 20, 5, 30, 25, 20, 16, 17, 18)
income <- c(20000, 40000, 35000, 22000, 50000, 5000, 100, 3000, 10000, 10)
neurotic <- c(10, 17, 14, 13, 21, 7, 13, 9, 14, 13)

lectureData <- data.frame(name, birth_date, job, friends, alcohol, income, neurotic)
lectureData

str(lectureData)
names(lectureData)
head(lectureData)


### 3.5.5. missing values
neurotic <- c(10, 17, NA, 13, 21, 7, 13, 9, 14, NA)
mean(neurotic)
mean(neurotic, na.rm = TRUE)
lectureData
lectureData <- data.frame(name, birth_date, job, friends, alcohol, income, neurotic)
lectureData
neurotic <- c(10, 17, 14, 13, 21, 7, 13, 9, 14, 13)
mean(neurotic)
lectureData <- data.frame(name, birth_date, job, friends, alcohol, income, neurotic)
lectureData