cwd <- getwd()
yields <- read.csv(paste(cwd, "/fertyield.csv", sep = ""))
attach(yields)

names(yields)
ncol(yields)
nrow(yields)
head(yields)

unique(yields[,1])
table(yields)
table(treatment)

which(treatment == "nitogen")
head(yields, 11)

# clearing the R console
# ctrl-L
# http://rfunction.com/archives/2120
# http://rfunction.com/history

detach(yields)
