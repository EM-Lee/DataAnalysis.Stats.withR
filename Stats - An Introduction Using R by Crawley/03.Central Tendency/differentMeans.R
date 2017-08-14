# http://economistatlarge.com/r-guide/arithmetic-harmonic-geometric-means-r

library(ggplot2)
library(reshape2)

# Function to calculate the harmonic mean
harmonicMean <- function(array) {
  if(!is.numeric(array)) {
    stop("Passed argument must be an array. Consider using sapply for data frames")
  }
  if(any(array < 0)) {
    stop("All values must be greater than zero.")
  }
  length(array) / sum(1 / array)
}

# Function to calculate the geometric mean
geometricMean <- function(array) {
  if(!is.numeric(array)) {
    stop("Passed argument must be an array. Consider using sapply for data frames")
  }
  if(any(array < 0)) {
    stop("All values must be greater than zero.
         If you are attempting to apply this function to rates,
         convert to +1 format.
         For example, 5% becomes 1.05 and -20% becomes .8.")
  }
  prod(array)^(1/length(array))
}

# Function to capture the three means based on the sample
fetchMeans <- function(sample) {
  #passed data frame with n number of rows and 2 columns (values and obs)
  arithmetic <- mean(sample$value)
  harmonic <- harmonicMean(sample$value)
  geometric <- geometricMean(sample$value)
  results <- data.frame(arithmetic, harmonic, geometric)
  
  return(results)
}

#### Graphs
# color scheme
ealred <- "#7D110C"
ealtan <- "#CDC4B6"
eallighttan <- "#F7F6F0"
ealdark <- "#423C30"
ealorange <- "#BB681C"
ealgreen <- "#3E4525"
ealblue <- "#25516D"

# function that plots the three means for comparison, called below
# first calculate the various means
# and then flatten to a data frame that
# can be plotted with ggplot2
plot.means <- function(sample) {
  results <- fetchMeans(sample)
  results.melted <- melt(results, variable.name = "Type", value.name = "Mean")
  
  g <- ggplot(sample, aes(x = obs, y = value)) +
    geom_bar(stat = "identity", alpha = 1, fill = ealtan) +
    geom_hline(data = results.melted, aes(yintercept = Mean, color = Type),
               show.legend = TRUE, size = 1) +
    scale_color_manual(name = "Type of Mean", 
                       values = c(ealred, ealorange, ealblue),
                       breaks = c("arithmetic", "harmonic", "geometric"),
                       labels = c(paste("Arithmetic", round(results$arithmetic, digits = 2)),
                                  paste("Harmonic", round(results$harmonic, digits =2)),
                                  paste("Geometric", round(results$geometric, digits = 2)))) +
    scale_x_discrete(breaks = NULL) +
    labs(x = "Observations", y = NULL) +
    theme(panel.background = element_rect(fill = eallighttan))
  return(g)
}

#### Comparison with Normally Distributed Sample

# First generate 'random' set of n numbers with mean of m. 
# These will be normally distributed
# so you expect arithmetic mean, harmonic mean, and geometric mean
# to be fairly consistent.
n <- 25
m <- 5
sample <- data.frame("value" = rnorm(n = n, mean = m))
sample$obs <- rownames(sample)

# study about the characteristics of the row
# http://www.perfectlyrandom.org/2015/06/16/never-trust-the-row-names-of-a-dataframe-in-R/
# this is also interesting
# http://www.perfectlyrandom.org/2015/05/16/colon-operator-in-R/

# Next plot the three means, compared with the sample population
g <- plot.means(sample)
g <- g + ggtitle("Mean Comparison with\nNormally Distributed Sample")
g
# ggsave("test.png")

#### Comparison based on sample with an Outlier
# Add a few outliers to distorn the population
sample.outliers <- sample
sample.outliers[n-2, 1] <- m^2.5

g.outlier <- plot.means(sample.outliers)
g.outlier <- g.outlier + ggtitle("Mean Comparison using\nSample with Outliers")
g.outlier