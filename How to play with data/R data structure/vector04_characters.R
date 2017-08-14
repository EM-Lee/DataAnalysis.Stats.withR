####
# character vector
####

x <- "Hello world!"
is.character(x)
length(x)
nchar(x)

x <- c("Hello", "world!")
length(x)
nchar(x)

### built-in datasets or other available
# http://www.sthda.com/english/wiki/r-built-in-data-sets
# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
# https://vincentarelbundock.github.io/Rdatasets/datasets.html
# https://www.r-bloggers.com/datasets-to-practice-your-data-mining/

# naming the values in a vector
# built-in dataset islands
# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/islands.html
islands
str(islands)
names(islands)
typeof(islands)
length(islands) #try ncol(islands), nrow(islands)
head(islands, -8)
tail(islands, -40)

islands[c("Asia", "Africa", "Antarctica")]
names(islands)[1:9] #try names(islands[1:9])
names(sort(islands, decreasing = TRUE))[1:6] #names of the six largest islands
names(sort(islands, decreasing = TRUE)[1:6])
sort(islands, decreasing = TRUE)[1:6]

# built-in Constants: letters & LETTERS
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/Constants.html
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/00Index.html
letters
LETTERS

letters[10]
LETTERS[24:26]

tail(LETTERS, 5)
head(letters, 10)

# built-in constant month.name
month.name
month.days <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
names(month.days) <- month.name
month.days
names(month.days[month.days == 31])
