### 4.4.8. a quick tutorial
install.packages("ggplot2")
library(ggplot2)

rm(list = ls())

fbData <- read.delim("FacebookNarcissism.dat", header = TRUE)
dim(fbData)
names(fbData)
str(fbData)
summary(fbData)
head(fbData, 20)

graph <- ggplot(fbData, aes(NPQC_R_Total, Rating))
graph
graph + geom_point()
graph + geom_point(shape = 17)
graph + geom_point(size = 6)
graph + geom_point(aes(colour = Rating_Type))
graph + geom_point(aes(colour = Rating_Type), position = "jitter")
graph + geom_point(aes(shape = Rating_Type), position = "jitter")
graph + geom_point(aes(colour = Rating_Type, shape = Rating_Type),
                   position = "jitter")
