rm(list = ls())
library("xlsx")

cwd <- getwd()
theLExlsx <- list.files(pattern = "y{1}_2010.xlsx$")
theLE <- paste(cwd, "/", theLExlsx, sep = "")
theGDPxlsx <- list.files(pattern = "a{1}_2010.xlsx$")
theGDP <- paste(cwd, "/", theGDPxlsx, sep = "")

life.world.fe <- read.xlsx(theLE, sheetIndex = 2)
life.world.ma <- read.xlsx(theLE, sheetIndex = 3)
head(life.world.fe)
head(life.world.ma)
life.world.fe$gender <- "female"
life.world.ma$gender <- "male"
head(life.world.fe)
head(life.world.ma)

life.fe.ma <- data.frame(rbind(life.world.fe, life.world.ma))
dim(life.world.fe)
dim(life.world.ma)
dim(life.fe.ma)
head(life.fe.ma)

attach(life.fe.ma)
byCountry <- life.fe.ma[order(Country.Name),]
head(byCountry)
write.csv(byCountry, file = "life.fe.ma.csv")
# http://www.statmethods.net/input/exportingdata.html
detach(life.fe.ma)