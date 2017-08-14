### ch02.05 - First Things First: Get to Know Your Data
# First, just plot the response variable on its own.
# called an index plot

cwd <- getwd(); cwd
dataF <- "das00.csv"
data <- read.csv(paste(cwd, "/", dataF, sep = ""))
attach(data)
str(data)
head(data)
plot(y) #try plot(data)
rowNum <- which(y > 10)
data[rowNum,]
y[50]

dataF <- "das.csv"
data <- read.csv(paste(cwd, "/", dataF, sep = ""))
attach(data)
plot(y)
detach(data)

dataFile <- "fertyield00.csv"
yields <- read.csv(paste(cwd, "/", dataFile, sep = ""))
attach(yields); str(yields)
head(yields)
unique(treatment)
table(treatment)
which(treatment == "nitogen")

dataFile <- "fertyield.csv"
yields <- read.csv(paste(cwd, "/", dataFile, sep = ""))
attach(yields)
table(treatment)
detach(yields)

# relationships
rm(list = ls())

cwd = getwd()
dataFile2 <- "scatter.csv"
data <- read.csv(paste(cwd, "/", dataFile2, sep = ""))
str(data); head(data)
attach(data); plot(x, y)

# graphical parameters
# http://www.statmethods.net/advgraphs/parameters.html
par()
plot(x, y, pch = 21, bg = "red")
plot(x, y, pch = 21, bg = "chartreuse1") 
# Colors in R
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
# https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf

dataFile3 <- "weather.data.csv"
data <- read.csv(paste(cwd, "/", dataFile3, sep = ""))
attach(data); str(data)
head(data)
table(yr)
plot(factor(month), upper)
plot(factor(month), upper, col = 27)

# http://www.r-graph-gallery.com/portfolio/boxplot/
# http://ggplot2.tidyverse.org/reference/geom_jitter.html
library(ggplot2)
Months <- as.factor(month)
Max.Temp <- upper
data <- data.frame(Months, Max.Temp)
qplot(x = Months, y = Max.Temp, data = data, 
      geom = c("boxplot"), fill = Months)
qplot(x = Months, y = Max.Temp, data = data, 
      geom = c("boxplot", "jitter"), fill = Months)
qplot(x = Months, y = Max.Temp, data = data, fill = Months) +
  geom_boxplot() + geom_jitter(shape = 1, color = "grey10")
  

# looking for interactions b/w continuous variables
# conditioning plots, coplots
cwd = getwd()
dataFile4 <- "coplot00.csv"
data <- read.csv(paste(cwd, "/", dataFile4, sep = ""))
str(data); head(data)
attach(data); plot(x, y)
par(mfrow = c(1, 2)); plot(x, y); plot(z, y)
windows(10, 5.5); par(mfrow = c(1, 2)); plot(x, y); plot(z, y)
# plot y against x given the value of z
# to look for interactions b/w continuous explanatory variables
# like x & z in this example
coplot(y~x|z, pch = 16, panel = panel.smooth)
windows(7, 7); coplot(y~x|z, pch = 16, panel = panel.smooth)
# for low values of z (in the bottom left-hand panel)
# the relationship b/w y & x is strongly negative
# for high values of z (top right)
# the relationship is strongly positive
# as z increases
# from bottom left to bottom right, then from top left to top right
# the slop of relationship b/w y & x increases
# rather smoothly from large negative values to zero
# then to increasingly positive values

# interactions involving categorical variables
cwd <- getwd()
dataFile5 <- "np.csv"
data <- read.csv(paste(cwd, "/", dataFile5, sep = ""))
attach(data); str(data)
head(data)

nitrogen == "yes"
which(nitrogen == "yes")
data[which(nitrogen == "yes"),]

par(mfrow = c(1, 2))
plot(nitrogen, yield, main = "N")
plot(phosphorus, yield, main = "P")
# what these main effects fail to show us is
# whether the response to "P" depends on the level of "N"
# what we need is an interaction plot showing effect sizes for
# four levels of response: 
# neither nutrien, just "N", just "P", or both "N" & "P"
mean(yield[nitrogen == "no"])
mean(yield[nitrogen == "yes"])
tapply(yield, nitrogen, mean)
mean(yield[phosphorus == "no"])
mean(yield[phosphorus == "yes"])
tapply(yield, phosphorus, mean)

mean(yield[nitrogen == "no" & phosphorus == "no"])
mean(yield[nitrogen == "yes" & phosphorus == "no"])
mean(yield[nitrogen == "no" & phosphorus == "yes"])
mean(yield[nitrogen == "yes" & phosphorus == "yes"])
tapply(yield, list(nitrogen, phosphorus), mean)

par(mfrow = c(1, 1))
barplot(tapply(yield, list(nitrogen, phosphorus), mean),
        beside = TRUE, xlab = "Phosphorus", ylab = "Yield")
legend(locator(1), legend = c("no", "yes"), title = "Nitrogen",
       fill = c("black", "lightgrey"))
# use a mouse to put the cursor where you want the legend box to appear