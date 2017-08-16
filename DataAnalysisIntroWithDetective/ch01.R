cwd <- getwd(); cwd
install.packages("ggplot2")
library(ggplot2)

### 01-06: simulation & histogram

## simulation
## fail or win? probability is 1 out of 100, replaceable, 100 times of drawing lots
lottery <- c("fail", "win")
sample(lottery, 100, prob = c(99, 1), replace = TRUE)
sample(lottery, 100, prob = c(99, 1), replace = TRUE) == "win" #true or false
sum(sample(lottery, 100, prob = c(99, 1), replace = TRUE) == "win") #number of wins

## simulation
lottery2 <- c("failed", "won")
res <- replicate(1000, 
                 sum(replicate(7, sample(lottery2, 100, prob = c(99, 1),
                                         replace = TRUE)) == "won"))
# so, (how many wins per week) * 1,000 weeks
hist(res, breaks = 0:20)
resD <- as.data.frame(table(res))
ggplot(resD, aes(y = Freq, x = res)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  xlab("# of wins per week") +
  ylab("weeks accum.") +
  ggtitle("Histogram")

## functions used
sum(1:1000)
sample(1:6, 1) #like throwing a dice
sample(1:6, 2)
sample(1:6, 100, replace = TRUE) #throwing a dice 100 times or throwing 100 dice at once

lottery <- c("꽝", "1등")
sample(lottery, 100, prob = c(99, 1), replace = TRUE)
sample(lottery, 100, prob = c(1, 99), replace = TRUE)
sample(lottery, 100, prob = c(2, 1), replace = TRUE)

tbl <- table(sample(1:6, 100, replace = TRUE)) #frequency table
tbl
# http://www.cyclismo.org/tutorial/R/tables.html
summary(tbl)
margin.table(tbl)
margin.table(tbl, 1)
prop.table(tbl)
prop.table(tbl, 1)
head(tbl)
rownames(tbl)
nrow(tbl)
ncol(tbl)
colnames(tbl) #error
dim(tbl)

# table or data frame?
# http://www.r-tutor.com/r-introduction/data-frame
# column vector vs. column slice
tbl2 <- data.frame(tbl)
tbl2
tbl2[[2]]
tbl2[["Freq"]]
tbl2$Freq
tbl2[, "Freq"]

tbl2[1]
tbl2["Freq"]
tbl2[c("Var1", "Freq")]
tbl2["Var1", "Freq"]

tbl2[2, ]
tbl2[c(2, 4),]
tbl2[tbl2$Freq == 13, ]
tbl2[tbl2$Freq == 13, ]$Freq

## histogram
hist(sample(1:6, 10000, replace = TRUE), breaks = 0:6)
