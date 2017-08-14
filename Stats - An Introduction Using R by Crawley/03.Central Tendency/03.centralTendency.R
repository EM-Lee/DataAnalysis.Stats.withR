### ch03. - Central Tendency
# central limit theorem

rm(list = ls())

cwd <- getwd()
dataFile <- "yvalues.csv"
yvals <- read.csv(paste(cwd, "/", dataFile, sep = ""))
str(yvals)
head(yvals)

attach(yvals)
hist(y)

# arithmetic mean
total <- sum(y); total
n <- length(y); n
ybar <- total/n; ybar
ybar <- sum(y)/length(y); ybar
# to put this logic into a general function
arithmetic.mean <- function(x) sum(x)/length(x)
arithmetic.mean
arithmetic.mean(y)
mean(y)

data <- c(3, 4, 6, 7)
arithmetic.mean(data)

# median - as arithmetic mean is highly sensitive to outliers
sorted <- sort(y); sorted
length(y)/2 #meaning the 20th value is the median
ceiling(length(y)/2)
sorted[20]
sorted[ceiling(length(y)/2)]
sort(y)[ceiling(length(y)/2)]
# case of even number
y
y.even <- y[-1]; y.even
length(y.even)
sort(y.even)[19] #ceiling(length(y.even)/2)
sort(y.even)[20] #ceiling(1 + length(y.even)/2)
(sort(y.even)[19] + sort(y.even)[20]) / 2
# use 'modulo' %% to know whether odd or even number
med <- function(x) {
  modulo <- length(x) %% 2
  if (modulo == 0) 
    (sort(x)[ceiling(length(x)/2)] +sort(x)[1 + ceiling(length(x)/2)]) / 2
  else 
    sort(x)[ceiling(length(x)/2)]
}
med(y)
med(y.even)
median(y)
median(y.even)

# geometric mean for processes that change multiplicatively
# G(x1, ..., xn) = (x1*...*xn)^(1/n)
# the number of insects on five different plants: 10, 1, 1000, 1, 10
100000^.2 #10
insects <- c(10, 1, 1000, 1, 10)
mean(insects) #204.4

geometric.mean <- function(x) prod(x)^(1/length(x))
geometric.mean
geometric.mean(insects)

# using logarithms
exp(mean(log(insects)))

# which population is the more variable?
x <- c(1:20); x
y.pop1 <- c(rep(seq(100, 200, 100), 10)); y.pop1
y.pop2 <- c(rep(seq(10, 20, 10), 10)); y.pop2
pop1 <- data.frame(y = y.pop1); pop1
pop2 <- data.frame(z = y.pop2); pop2
plot(x, y.pop1, type = "l", col = "red")
# lines(x, y.pop2, col = "green") #not working

# try again with ggplot
x <- c(1:20); x
y.pop1 <- c(rep(seq(100, 200, 100), 10)); y.pop1
y.pop2 <- c(rep(seq(10, 20, 10), 10)); y.pop2
pop <- data.frame(y1 = y.pop1, y2 = y.pop2)
attach(pop)
str(pop)
head(pop)

library(ggplot2)
ggplot(pop) + labs(y = "y pop.") + theme(legend.position = "none") +
  geom_line(aes(x, y = y1, colour = "blue")) + 
  geom_line(aes(x, y = y2, colour = "green"))

# They are equally variable.
# It is just that one population has a higher mean value than the other
mean(y1); mean(y2)
# In order not to fall into the trap of saying that
# the upper curve is more variable than the lower curve,
# it is good practice to graph the logarithms
# rather than the raw values of things
# like population sizes that change multiplicatively

ggplot(pop) + labs(y = "log(y pop.)") + theme(legend.position = "none") +
  geom_line(aes(x, y = log(y1), colour = "blue")) + 
  geom_line(aes(x, y = log(y2), colour = "green"))

# harmonic mean
v <- c(1, 2, 4, 1)
length(v) / sum(1/v)
1 / mean(1/v)
