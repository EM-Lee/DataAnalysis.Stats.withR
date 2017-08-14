library(foreign) #to import TESS data in SPSS format

cwd = getwd()
dataFile = "TESS2_089_Trawalter_Client.sav"
tess <- read.spss(paste(cwd, "/", dataFile, sep = ""),
                  use.value.labels = FALSE, to.data.frame = TRUE)
attach(tess); str(tess)
head(tess)
colnames(tess) #row.names(tess)
wanted.var <- c("CaseID", "PPGENDER", "PPAGE", "PPETHM", "PPEDUCAT",
                "PPINCIMP", "PPMARIT")
tess.keep <- tess[,wanted.var]; head(tess.keep)
dim(tess)
dim(tess.keep)

var.first20 <- c(1:20)
tess.first20 <- tess[,var.first20]; head(tess.first20)
tess.first10.last10 <- tess[, c(1:10, 40:49)]; head(tess.first10.last10)
dim(tess)
dim(tess.first20)
dim(tess.first10.last10)

var.drop <- c("tm_start", "tm_finish", "duration")
tess.drop <- tess[, colnames(tess) != var.drop]
colnames(tess.drop)

tess.drop.number <- tess[, -c(4, 5, 6)]
colnames(tess.drop.number)
tess.drop.range <- tess[, -c(4:6) ]
colnames(tess.drop.range)

# with PEW data
cwd <- getwd()
dataFile2 <- "February_2012_csv.csv"
pew <- read.csv(paste(cwd, "/", dataFile2, sep = ""), header = TRUE)
attach(pew); str(pew)
head(pew)

pew.republican.indexing <- pew[party == 1,]
pew.republican.indexing

pew.republican.subset <- subset(pew, party ==1)
pew.republican.subset
dim(pew.republican.subset)

pew.female.democrat.indexing <- pew[(party == 2 & sex == 2),]
pew.female.democrat.indexing

pew.female.democrat.subset <- subset(pew, party == 2 & sex == 2)
pew.female.democrat.subset

# variable keeping
var.keep <- c("sex", "race", "age", "inc", "educ", "party")
pew.select.1 <- pew[, var.keep]
head(pew.select.1)
pew.select.1 <- pew.select.1[party == 1 & sex == 1,]
head(pew.select.1)

pew.select.2 <- pew[, var.keep]
head(pew.select.2)
pew.select.2 <- subset(pew.select.2, party == 1 & sex == 1)
head(pew.select.2)

pew.select.3 <- pew[party == 1 & sex == 1, var.keep]
head(pew.select.3)

pew.select.4 <- subset(pew, party == 1 & sex ==1)[, var.keep]
head(pew.select.4)

### data aggregation

# aggregate examples from
# http://www.statmethods.net/management/aggregate.html
mtcars; str(mtcars)
attach(mtcars)
aggregate(mtcars[, c(1, 3)], list(Cylinder = cyl), mean)
aggregate(mtcars, list(cyl, vs), mean, na.rm = TRUE)
# to check it out, see "mtcars - Copy.xlsx" file
write.table(mtcars, "mtcars.csv", sep = ",", col.names = TRUE)
# exporting data
# http://www.statmethods.net/input/exportingdata.html

# aggregate examples from
# https://datascienceplus.com/aggregate-data-frame-r/
# first, a data.frame example
d.f <- data.frame(rating = c("AAA", "A", "A",
                             "AAA", "BB", "BB",
                             "AAA", "A"))
i <- 1
by <- d.f$rating
# by
# unique(by)
# unique(by)[i + 1]
# by == unique(by)[i]
sub.data.frame <- d.f[by == unique(by)[i],]; sub.data.frame

# getting the number of appearances of the various values
values <- data.frame(value = c("a", "a", "a", "a", "a",
                               "b", "b", "b",
                               "c", "c", "c", "c")); values
nr.of.appearance <- aggregate(values,
                              list(unique.values = values$value),
                              length); nr.of.appearance

# Sys.Date()
# date()
# http://www.statmethods.net/input/dates.html
mydates <- as.Date(c("2007-06-22", "2004-02-13"))
mydates
days <- mydates[1] - mydates[2]
days

# seq.Date
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/seq.Date.html
seq(as.Date("2001/1/1"), as.Date("2010/12/31"), "year")
seq(as.Date("2001/1/1"), as.Date("2100/12/31"), "10 years")
seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "month")
seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "3 month")
seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "quarter")
seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "week")
seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "2 weeks")
seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "days")
seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "10 day")

# getting the last day of each month
days <- seq(as.Date("2001/1/1"), as.Date("2001/12/31"), "days")
dates <- data.frame(date = as.Date(days, format = "%Y-%m-%d"))
dates
last.day <- aggregate(dates["date"],
                      list(month = substr(dates$date, 1, 7)),
                      max)
last.day