rm(list = ls())

cwd <- getwd()
dataF <- "February_2012_csv.csv"
pew <- read.csv(paste(cwd, "/", dataF, sep = ""), header = TRUE)

summary(pew)
str(pew)
head(pew)

attach(pew)
# q16: ... how often, if ever, do you talk about politics or ...
# very often =1, sometimes = 2, rarely = 3, never = 4
# Don't know = 8, Refused = 9
table(q16)

pew$q16copy <- pew$q16
attach(pew); table(q16copy)
q16copy[q16 == 8 | q16 == 9] <- NA #q16copy[q16 >= 8] <- NA
table(q16, q16copy, useNA = 'always')
# http://www.endmemo.com/program/R/table.php
# http://www.cyclismo.org/tutorial/R/tables.html

pew$q16copy99 <- pew$q16copy
attach(pew); table(q16copy99)
q16copy99[is.na(q16copy)] <- 99
table(q16copy, q16copy99, useNA = "always")

### reverse-coding
# c("very often", "sometimes", "rarely", "never") into
# c("never",  "rarely", "sometimes", "very often")
reversecoding <- c(4, 3, 2, 1)
q16copyrc <- reversecoding[q16copy]
table(q16copy, q16copyrc)

# library 'foreign'
# http://www.statmethods.net/input/exportingdata.html
library(foreign)

cwd <- getwd()
dataF2 <- "TESS2_089_Trawalter_Client.sav"
tess <- read.spss(paste(cwd, "/", dataF2, sep = ""),
                  use.value.labels = FALSE, to.data.frame = TRUE)
dim(tess)
str(tess)
head(tess)
attach(tess); table(Q4) #range: 0 to 10, -1 represents no response

tess$Q4rc <- tess$Q4
table(tess$Q4rc)
tess$Q4rc[tess$Q4 == -1] <- NA
tess$Q4rc <- 10 - tess$Q4 #reverse-coding
table(tess$Q4, tess$Q4rc, useNA = 'always')


### recoding
tess$XREL1
table(tess$XREL1)
table(tess$XREL1, useNA = 'always')

# recoding into big 5
table(tess$XREL1, useNA = 'always') > 100
(table(tess$XREL1, useNA = 'always') > 100)[]

which((table(tess$XREL1, useNA = 'always') > 100) == TRUE)
which(match((table(tess$XREL1, useNA = 'always') > 100), TRUE) == 1)

tess$big5[tess$XREL1 == 3] <- 100
tess$big5[tess$XREL1 == 1 | tess$XREL1 == 2 |
          tess$XREL1 == 4 | tess$XREL1 == 9] <- 200
tess$big5[tess$XREL1 == 10 | tess$XREL1 == 11] <- 300
tess$big5[tess$XREL1 == 13] <- 400
tess$big5[tess$XREL1 == 5 | tess$XREL1 == 6 |
          tess$XREL1 == 7 | tess$XREL1 == 8 | tess$XREL1 == 12] <- 500
table(tess$XREL1, tess$big5, useNA = 'always')

names(tess)
aggregate(tess[,11], list(tess$XREL1), length)
aggregate(tess[,51], list(tess$big5), length)
aggregate(tess[,c(11, 51)], list(tess$XREL1, tess$big5), length)

# http://genomicsclass.github.io/book/pages/dplyr_tutorial.html
# https://rpubs.com/justmarkham/dplyr-tutorial
# http://stat545.com/block009_dplyr-intro.html
library(plyr)
count(tess, "big5")
count(tess, c("XREL1", "big5"))

tess$big5.text <- tess$XREL1
tess$big5.text[tess$XREL1 == 3] <- 'catholic'
tess$big5.text[tess$XREL1 == 1 | tess$XREL1 == 2 |
            tess$XREL1 == 4 | tess$XREL1 == 9] <- 'protestant'
tess$big5.text[tess$XREL1 == 10 | tess$XREL1 == 11] <- 'other.christian'
tess$big5.text[tess$XREL1 == 13] <- 'atheist'
tess$big5.text[tess$XREL1 == 5 | tess$XREL1 == 6 |
            tess$XREL1 == 7 | tess$XREL1 == 8 | tess$XREL1 == 12] <- 'misc.religion'
table(tess$XREL1, tess$big5, useNA = 'always')
table(tess$XREL1, tess$big5.text, useNA = 'always')

# using car library to recode
install.packages("car")
library(car)
tess$big5.car <- recode(tess$XREL1,"1 = 200; 2 = 200; 3 = 100;
                        4 = 200; 5 = 500; 6 = 500; 7 = 500; 8 = 500;
                        9 = 200; 10 = 300; 11 = 300; 12 = 500; 13 = 400")
table(tess$XREL1, tess$big5.car, useNA = 'always')

# recoding Q4
dim(tess)
colnames(tess)
str(tess$Q4)
table(tess$Q4)
table(tess$Q4)/dim(tess)[1] #to check proportion of each value
# recoding
# [0, 3] - very insensitive: 100, [4] - insensitive: 200
# [5, 6] - sensitive: 300, [7, 10] - very sensitive: 400
tess$Q4r <- tess$Q4 
tess$Q4r[tess$Q4 == -1] <- NA
tess$Q4r[tess$Q4 >= 0 & tess$Q4 <= 3] <- 100
tess$Q4r[tess$Q4 == 4] <- 200
tess$Q4r[tess$Q4 == 5 | tess$Q4 == 6] <- 300
tess$Q4r[tess$Q4 >= 7 & tess$Q4 <= 10] <- 400
table(tess$Q4, tess$Q4r, useNA = 'always')
table(tess$Q4r, useNA = 'always')/dim(tess)[1]

library(plyr)
count(tess, c("tess$Q4", "tess$Q4r"))
aggregate(tess[,19], list(Q4 = tess$Q4, Q4Recoded = tess$Q4r), length)

# recoding Q4, v2
# [0, 2.5] - very insensitive: 100, (2.5, 5] - insensitive: 200
# (5, 7.5] - sensitive: 300, (7.5, 10] - very sensitive: 400
colnames(tess)
tess$Q4r2 <- tess$Q4
str(tess$Q4r2)
table(tess$Q4r2, useNA = 'always')
tess$Q4r2[tess$Q4 == -1] <- NA; tess$Q4r2
tess$Q4r2 <- cut(tess$Q4r2, breaks = 4); tess$Q4r2
# cut function
# http://rforpublichealth.blogspot.com/2012/09/from-continuous-to-categorical.html
table(tess$Q4, tess$Q4r, useNA = 'always')
table(tess$Q4r, useNA = 'always')/dim(tess)[1]

# recoding Q4, v3, using quantile function
colnames(tess)
tess$Q4r3 <- tess$Q4
tess$Q4r3[tess$Q4 == -1] <- NA

table(tess$Q4r3, useNA = 'always')
q4.point <- quantile(tess$Q4r3, prob = c(0, 1/3, 2/3, 1), na.rm = TRUE)
q4.point
tess$Q4r3 <- cut(tess$Q4r3, q4.point)
table(tess$Q4r, tess$Q4r3, useNA = 'always')
