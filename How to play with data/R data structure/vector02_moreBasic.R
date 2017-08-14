####
# R is a vector-based language.
# You can think of a vector as a row or column of numbers or text.
# The list of numbers {1,2,3,4,5}, for example, could be a vector.

# A vector is the simplest type of data structure in R.
# The R manual defines a vector as 
# "a single entity consisting of a collection of things."
# A collection of numbers, for example, is a numeric vector
# - the first five integer numbers form a numeric vector of length 5.
####

### to construct a vector
c(1, 2, 3, 4, 5) #c() function
1:5 #: operator
# to calcuate the some of this vector
sum(1:5)

### storing and calculating values
x <- 1:5; x
x + 2
x + 6:10
y <- 10
z <- x + y; z

### combining vectors
# http://www.r-tutor.com/r-introduction/vector/combining-vectors

a <- c(2, 3, 5)
b <- c("aa", "bb", "cc", "dd", "ee")
c <- c(a, b); c

gr <- c(12, 4, 4, 6, 9, 3)
ge <- c(5, 3, 2, 2, 12, 9)
allG <- c(gr, ge)

### summarizing a vector
gr <- c(12, 4, 5, 6, 9, 3)
ge <- c(5, 4, 2, 4, 12, 9)

min(gr)
max(gr)
sum(gr)
sum(ge)
sum(gr, ge) #try prod(), cumsum(), cumprod(), cummin(), cummax(), diff()
cumsum(gr)
cummax(ge)
diff(gr)

x <- c(3, 6, 2, NA, 1)
sum(x)
sum(x, na.rm = TRUE)
cummin(x)
diff(x)

### recycling arguments
gr <- c(12, 4, 5, 6, 9, 3)
# suppose you split up the number of gr
# made into two-pointers and three-pointers
gr.pointers <- c(10, 2, 4, 0, 4, 1, 4, 2, 7, 2, 1, 2)
points <- gr.pointers * c(2, 3); points
sum(gr.pointers * c(2, 3))
sum(points)
round(diff(gr) / gr * 100)
round(diff(gr) / gr[1:5] * 100) #want to know how much improved?
