history(Inf)

ch02 <- getwd()
worms <- read.csv(paste(ch02, "/worms.csv", sep = ""))
# about sep vs. collapse
# https://gist.github.com/briandk/d9231ba1e2603eed0df1

cwd <- getwd()
csv <- list.files(pattern = "^wo.*csv$")
worms <- read.csv(paste(cwd, "/", csv, sep = ""))
names(worms)

# in order that we can refer to the variable names directly
# without prefixing them by the dataframe name
attach(worms)
worms
nrow(worms)
ncol(worms)

# selecting parts of a dataframe: subscripts
worms[, 1:3]
worms[5:15,]
# operators in R
# http://www.statmethods.net/management/operators.html
worms[Area > 3 & Slope < 3,]
worms[Area > 3 | Slope <3,]
worms[Area>3 & Slope<3,c("Area","Slope")]
worms[Slope == 0, 1]
worms[which(Slope == 0), 1]
worms[order(Area),]
worms[order(Area), c(2, 3, 5, 7)]
worms[order(Damp), c(1, 6)]
worms[order(Field.Name), c(1, 6)]
worms[rev(order(Area)), c(2, 3, 5, 7)]
worms[rev(order(worms[, 5])), c(5, 7)]

# summarizing the content of dataframes
summary(worms)

# tapply is useful
# when we have a dataset that can be broken up into groups
# we want to break it up into groups
# within each group, we want to apply a function
# https://www.r-bloggers.com/r-function-of-the-day-tapply-2/
# https://www.r-bloggers.com/apply-lapply-rapply-sapply-functions-in-r/

# using with() and by()
# http://www.statmethods.net/stats/withby.html
# using with() and within()
# http://rfunction.com/archives/2182

with(worms, tapply(Worm.density, Vegetation, mean))
with(worms, tapply(Field.Name, Damp, summary))
with(worms, tapply(Field.Name, Damp, by = group))
with(worms, tapply(Field.Name, Vegetation))

# aggregate
# http://www.statmethods.net/management/aggregate.html
# https://datascienceplus.com/aggregate-data-frame-r/
aggregate(worms[, c(2, 3, 5, 7)], list(Vegetation), mean)
aggregate(worms[, c(2, 3, 5, 7)], list(Damp), mean)
aggregate(worms[, c(2, 3, 5, 7)], list(Community = Vegetation), mean)
aggregate(worms[, c(2, 3, 5, 7)], list(Moisture = Damp, Community = Vegetation), mean)
with(worms, tapply(Slope, list(Damp, Vegetation), mean))





