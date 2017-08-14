####
# https://www.programiz.com/r-programming/vector
# Vector is a basic data structure in R.
# It contains element of the same type.
# The data types can be logical, integer, double, character, complex or raw.
# A vector's type can be checked with the typeof() function.
# Another important property of a vector is its length.
# This is the number of elements in the vector
# and can be checked with the function length().
####

### how to create?
# Vectors are generally created using the c() function.
# Since, a vector must have elements of the same type,
# this function will try and coerce elements to the same type,
# if they are different.
# Coercion is from lower to higher types
# from logical to integer to double to character.

rm(list = ls())

# using c() function
x <- c(1, 5, 4, 9, 0)
typeof(x)
is.integer(x)
length(x)

x <- c(1, 5.4, TRUE, "hello"); x
typeof(x)
length(x)

# using : operator
x <- 1:7; x
y <- 2:-2; y

# using seq() function
# by defining number of points in an interval, or the step size
seq(1, 3, by = .2) #specify step size
seq(from = 4.5, to = 2.5, by = -.5)
seq(1, 5, length.out = 4) #specify length of the vector
seq(from = -2.7, to = 1.3, length.out = 9)

# repeating vectors
rep(c(0, 0, 7), times = 3)
rep(c(2, 4, 2), each = 3)
rep(c(0, 7), times = c(4, 2))
rep(1:3, length.out = 7)

### how to access elements of a vector?
# Elements of a vector can be accessed using vector indexing.
# The vector used for indexing can be logical, integer or character vector.
# Vector index in R starts from 1,
# unlike most programming languages where index start from 0.
# We can use a vector of integers as index to access specific elements.
# We can also use negative integers
# to return all elements except that those specified.
# But we cannot mix positive and negative integers while indexing
# and real numbers, if used, are truncated to integers.

x <- seq(0, 10, by = 2); x
x[3] #access 3rd element
x[c(2, 4)] #access 2nd and 4th element
x[-1] #access all but 1st element
x[c(2, -4)] #cannot mix positive and negative integers
x[c(2.4, 3.54)] #real numbers are truncated to integers

numbers <- 30:1; numbers
# the bracket function takes vectors as arguments
numbers[5]
# if you want to select more than one number,
# you can simply provide a vector of indices as an argument
# inside the brackets
numbers[c(5, 11, 3)]
indices <- c(5, 11, 3)
numbers[indices]
# You can use indices to drop values from a vector as well.
numbers[-3] #if you want all the numbers except for the third value
numbers[1:20]
numbers[(1:10)]
numbers[-(1:20)]
numbers[-1:20] #will get error

# using logical vector
# When we use a logical vector for indexing,
# the position where the logical vector is TRUE is returned.
x <- seq(0, 10, by = 2); x
x[c(TRUE, FALSE, FALSE, TRUE)] #recycle
x[x < 2] #filtering vectors based on conditions
x[x > 2]

s <- c("aa", "bb", "cc", "dd", "ee")
s[c(FALSE, TRUE, FALSE, TRUE, FALSE)]
L <- c(FALSE, TRUE, FALSE, TRUE, FALSE)
s[L]

# using character vector
x <- c("first" = 3, "second" = 0, "third" = 9); x
names(x)
x["second"]
x[c("first", "third")]

### how to modify a vector?
# We can modify a vector using the assignment operator.
# If we want to truncate the elements, we can use reassignments.

x <- -3:2; x
x[2] <- 0; x
x[x < 0] <- 5; x
x <- x[1:4]; x

gr <- c(12, 4, 4, 6, 9, 3)
ge <- c(5, 3, 2, 2, 12, 9)
gr.copy <- gr
# R doesn't have an Undo button, so when you change a vector,
# there's no going back.
# You can prevent disasters by first making a copy of your object
# and then changing the values in the copy.
gr[c(2, 4)] <- 4; gr
gr[4] <- 11;gr

gr <- gr.copy; gr
gr > 5
# which() function takes a logical vector as argument
# hence, you can save the outcome of a logical vector
# in an object and pass that to the which() function
which(gr > 5)
the.best <- ge < gr; the.best
which(the.best)
gr[the.best]
sum(the.best)
sum(!the.best)
any(the.best) #any value in a logical vector is TRUE
all(the.best)

x <- c(3, 6, 1, NA, 2); x
x > 2
x[x > 2]
is.na(x)
!is.na(x)
x[!is.na(x)]

min.gr <- gr == min(gr); min.gr
max.gr <- gr == max(gr); max.gr
min.gr | max.gr
match(min.gr, max.gr)
match(max.gr, min.gr)

### how to delete a vector?
# We can delete a vector by simply assigning a NULL to it.

x <- seq(-3, 2); x
x <- NULL; x
x[4]
