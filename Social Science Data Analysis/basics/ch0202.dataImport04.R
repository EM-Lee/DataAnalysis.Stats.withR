install.packages('foreign')
library('foreign')

cwd <- getwd()
spssFile <- list.files(pattern = "2010.sav$")
theFile <- paste(cwd, "/", spssFile, sep = "")
life.world.sps <- read.spss(file = theFile, use.value.labels = FALSE, to.data.frame = TRUE)

names(life.world.sps)
head(life.world.sps)