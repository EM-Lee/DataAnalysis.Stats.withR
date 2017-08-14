cwd <- getwd()

data <- read.csv(paste(cwd, "/das.csv", sep = ""))
attach(data)

names(data)
nrow(data)
ncol(data)
head(data)

plot(y)
y

### how to remove
# all objects
# rm(list = ls())
# only the functions (but not the variables)
# rm(list = lsf.str())
# all objects except for functions
# rm(list = setdiff(ls(), lsf.str()))

which(y > 10)
y[50]
