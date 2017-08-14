### basic arithmetic operators
gr <- c(12, 4, 4, 6, 9, 3)
ge <- c(5, 3, 2, 2, 12, 9)
gr.money <- gr * 120; gr.money
ge.money <- ge * 145; ge.money
gr.money + ge.money

# order of operations
4 + 2 * 3
(4 + 2) * 3

# operators are also functions
"+"(2, 3)

# testing vector types
is.numeric(gr)
is.integer(gr)
# R disagrees with the math teacher here.
# Integer has a different meaning for R
# than it has for us.
# The result of is.integer() isn't about the value
# but about the way the value is stored in memory.
# R has two main modes for storing numbers.
# The standard mode is double.
# In this mode, every number uses 64 bits of memory.
# The number also is stored in three parts.
# One bit indicates the sign of the number,
# 52 bits represent the decimal part of the number,
# and the remaining bits represent the exponent.
# This way, you can store numbers as big as 1.8 × 10308 in only 64 bits.
# The integer mode takes only 32 bits of memory,
# and the numbers are represented as binary integers in the memory.
# So, the largest integer is about 2.1 billion, or, more exactly, 231 - 1.
# That's 31 bits to represent the number itself,
# 1 bit to represent the sign of the number, and -1 because you start at 0.

x <- c(4L, 6L)
is.integer(x)

# useful mathematical functions
log(1:3)
log(1:3, base = 6)
log2(1:3)
log10(1:3)
x <- log(1:3)
exp(x)

# scientific notation
1.33e4 #1.33 * 10^4
4.12e-2 #4.12 * 10^-2
1.2e6 / 2e3

# rounding number
round(123.456, digits = 2)
round(-123.456, digits = -2)
signif(-123.456, digits = 4) #significant digits to be retained
# Both round() and signif() round numbers to the nearest possibility.
# So, if the first digit that's dropped is smaller than 5,
# the number is rounded down.
# If it's bigger than 5, the number is rounded up.

# If the first digit that is dropped is exactly 5,
# R uses a rule that's common in programming languages:
# Always round to the nearest even number.
round(1.5)
round(2.5)
round(-4.5)

# Contrary to round(), 
# three other functions always round in the same direction.
# floor(x) rounds to the nearest integer that's smaller than x.
floor(-123.45)
# ceiling(x) rounds to the nearest integer that's larger than x.
ceiling(123.45)
# trunc(x) rounds to the nearest integer in the direction of 0.
trunc(123.65)
