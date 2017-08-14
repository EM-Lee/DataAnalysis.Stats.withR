rm(list=ls())
cwd <- getwd()
rFile <- list.files(pattern = "2010.rda$")

life.world.rda <- load(file = paste(cwd, "/", rFile, sep = "") )