### mean & expected value
mean(sample(1:6, 100, replace = TRUE))

## expected value after 100 times of rolling a dice, and then repeat it 100000 times
res <- replicate(100000, mean(sample(1:6, 100, replace = TRUE)))
hist(res)

dice <- data.frame(res)
ggplot(dice, aes(x = dice)) +
  geom_histogram(binwidth = .1, fill = "steelblue", colour = "black", alpha = .5) +
  xlab("Expected Value") + ylab("# of rolling") +
  ggtitle("Expected value after 100 rollings")


# expected value
# http://www.statisticshowto.com/expected-value/
