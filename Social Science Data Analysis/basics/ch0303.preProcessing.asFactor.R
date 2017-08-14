library(foreign)

cwd <- getwd()
dataF2 <- "TESS2_089_Trawalter_Client.sav"
tess <- read.spss(paste(cwd, "/", dataF2, sep = ""),
                  use.value.labels = FALSE, to.data.frame = TRUE)
str(tess)
colnames(tess)
table(tess$XTESS089, useNA = 'always')
is.numeric(tess$XTESS089)
is.factor(tess$XTESS089)

tess$stimulus <- as.factor(tess$XTESS089)
is.numeric(tess$stimulus)
is.factor(tess$stimulus)

tess$stimulus.num <- as.numeric(tess$stimulus)
is.numeric(tess$stimulus.num)
is.factor(tess$stimulus.num)
