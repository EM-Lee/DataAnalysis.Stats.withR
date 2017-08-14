rm(list = ls())
cwd <- getwd()
data <- read.csv(paste(cwd, "/weather.data.csv", sep = ""))
attach(data)
head(data)
nrow(data)

plot(factor(month), upper)
# factors in R; categorical variables
# https://www.stat.berkeley.edu/classes/s133/factors.html

which(month == 1)
lengths(which(month == 1))
length(which(month == 1))
sum(which(month == 1))
table(month)

summary(upper)
min(upper)
max(upper)
mean(upper)
median(upper)
quantile(upper)
summary(month)

aggregate(data[,1], list(month), mean)
with(data, tapply(upper, month, mean))
aggregate(data[,1], list(month), max)
with(data, tapply(upper, month, max))
aggregate(data[,1], list(month), min)
with(data, tapply(upper, month, min))
aggregate(data[,1], list(Month = month), median)
with(data, tapply(upper, month, median))
