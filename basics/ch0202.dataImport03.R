cwd <- getwd()
csvFile <- list.files(pattern = "2010.csv$")
theFile <- paste(cwd, "/", csvFile, sep = "")

life.world.spc <- read.table(file = theFile, sep = ",", header = TRUE)

names(life.world.spc)
head(life.world.spc)

life.world.spc2 <- read.csv(file = theFile)

names(life.world.spc2)
head(life.world.spc2)
