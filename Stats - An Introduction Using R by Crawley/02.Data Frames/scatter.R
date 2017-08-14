rm(list = ls())

cwd <- getwd()
data <- read.csv(paste(cwd, "/scatter.csv", sep = ""))
attach(data)
head(data)
nrow(data)

plot(y)
plot(x, y)
plot(y~x)
plot(x, y, pch = 21, bg = "red")

# read two important issues from the plot