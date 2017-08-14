library("xlsx")

cwd <- getwd()
theLExlsx <- list.files(pattern = "y{1}_2010.xlsx$")
theLE <- paste(cwd, "/", theLExlsx, sep = "")
theGDPxlsx <- list.files(pattern = "a{1}_2010.xlsx$")
theGDP <- paste(cwd, "/", theGDPxlsx, sep = "")

# about Regular Expressions
# http://stat545.com/block022_regular-expression.html
# Regular expression is a pattern 
# that describes a specific set of strings
# with a common structure.
# It is heavily used for string matching / replacing
# in all programming languages,
# although specific syntax may differ a bit. 

# strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")
# grep("ac*b", strings, value = TRUE)
# grep("ac+b", strings, value = TRUE)
# grep("ac?b", strings, value = TRUE)
# grep("ac{2}b", strings, value = TRUE)
# grep("ac{2,}b", strings, value = TRUE)
# grep("ac{2,3}b", strings, value = TRUE)

# strings <- c("abcd", "cdab", "cabd", "c abd")
# grep("ab", strings, value = TRUE)
# grep("^ab", strings, value = TRUE)
# grep("ab$", strings, value = TRUE)
# grep("\\bab", strings, value = TRUE)

# strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")
# grep("ab.", strings, value = TRUE)
# grep("ab[c-e]", strings, value = TRUE)
# grep("ab[^c]", strings, value = TRUE)
# grep("^ab", strings, value = TRUE)
# grep("\\^ab", strings, value = TRUE)
# grep("abc|abd", strings, value = TRUE)
# gsub("(ab) 12", "\\1 34", strings)

life.world.xlsx <- read.xlsx(file = theLE, sheetIndex = 1, header = TRUE)
gdp.world.xlsx <- read.xlsx(file = theGDP, sheetIndex = 1, header = TRUE)

names(gdp.world.xlsx)
life.gdp <- merge(gdp.world.xlsx, life.world.xlsx, by = "Country.Code")
ncol(life.gdp)
names(life.gdp)
nrow(life.gdp)

head(gdp.world.xlsx, 11)
head(life.world.xlsx, 11)
head(life.gdp, 11)
