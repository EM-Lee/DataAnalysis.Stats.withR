install.packages("xlsx")
library("xlsx")

cwd <- getwd()
xlFile <- list.files(pattern = "2010.xlsx$")
xlsxFile <- paste(cwd, "/", xlFile, sep = "")
  
life.world.xlsx <- read.xlsx(file = xlsxFile, sheetIndex = 1)

names(life.world.xlsx)
head(life.world.xlsx)