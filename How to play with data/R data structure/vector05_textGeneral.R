####
# manipulating text
####

### combining and splitting strings
pangram <- "The quick brown fox jumps over the lazy dog"; pangram
typeof(pangram)
strsplit(pangram, "")
words <- strsplit(pangram, " "); words
typeof(words)
unique(words)
unique(tolower(words))
tolower("Some TEXT in Mixed CASE")
toupper("Some TEXT in Mixed CASE")

### concatenating
# by default, paste() uses a blank space to concatenate the vectors
paste("The", "quick", "brown", "fox")
# by using c(), you pass a vector as a single argument to paste()
paste(c("The", "quick", "brown", "fox"))
paste(c("The", "quick", "brown", "fox"), collapse = " ")
paste(c("The", "quick", "brown", "fox"), collapse = "_")

paste(LETTERS[1:5], 1:5)
paste(LETTERS[1:5], 1:5, sep = "")
paste(LETTERS[1:5], 1:5, sep = "_")
paste(LETTERS[1:5], 1:5, sep = "_", collapse = "")
paste(LETTERS[1:5], 1:5, sep = "_", collapse = "---")

paste("Sample", 1:5)
paste("Sample", 1:5, sep = "")

### sorting text
paste(c("A", "B"), c(1, 2, 3, 4), sep = "-") #vector recycling
paste("A", c(1, 2, 3, 4, 5), sep = "-")

sort(letters)
sort(letters, decreasing = TRUE)

### finding text
# built-in dataset states.name
# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html
state.name
str(state.name)
head(state.name)
head(substr(state.name, start = 3, stop = 6))

### searching by pattern
grep("New", state.name)
state.name[grep("New", state.name)]
state.name[grep("new", state.name)] #case sensitive

state.name[grep(" ", state.name)]
state.name[grep("East", state.name)]

### substituting text
# gsub() stands for global sub()
gsub("cheap", "sheep's", "A wolf in cheap clothing")

x <- c("file_a.csv", "file_b.csv", "file_c.csv")
y <- gsub("file_", "", x); y
gsub(".csv", "", y)

### regular expressions allow you to search for patterns inside text
rwords <- c("bach", "back","beech", "beach", "black")
grep("beach|beech", rwords)
rwords[grep("beach|beech", rwords)]
rwords[grep("be(a|e)ch", rwords)]
rwords[grep("b(e*|a*)ch", rwords)]

# https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf
# http://r4ds.had.co.nz/strings.html
# http://biostat.mc.vanderbilt.edu/wiki/pub/Main/SvetlanaEdenRFiles/regExprTalk.pdf

# beware of metacharacters
# $ * + . ? [ ] ^ { } | ( )
# when matching any metacharacter as a regular character,
# precede it with a double backslash
# When matching a backslash as a regular character,
# write four backslashes

s = "gsub$uses$regular$expressions"
s1 = gsub(pattern = "$", replacement = ".", s); s1
s1 = gsub(pattern = "\\$", replacement = ".", s); s1
s1 = gsub("\\$", ".", s); s1

metaChar = c("$","*","+",".","?","[","^","{","|","(","\\")
grep("\\$", metaChar, value = TRUE)
grep("\\", metaChar, value = TRUE)
grep("\\\\", metaChar, value = TRUE)
grep("\\(", metaChar, value = TRUE)
gsub("\\|", ".", "gsub|uses|regular|expressions")

sp <- strsplit("strsplit.also.uses.regular.expressions", ".")
sp; typeof(sp)
sp <- unlist(strsplit("strsplit.also.uses.regular.expressions", "."))
sp; typeof(sp)
sp <- strsplit("strsplit.also.uses.regular.expressions", "")
sp; typeof(sp)
sp <- unlist(strsplit("strsplit.also.uses.regular.expressions", ""))
sp; typeof(sp)
strsplit("strsplit.also.uses.regular.expressions", "\\.")
strsplit("strsplit.also.uses.regular.expressions", ".", fixed = TRUE)

# replace mulitple periods with a single one
d1 <- data.frame(id...of....patient = c(1, 2), patient....age = c(1, 2))
d1; names(d1)
names(d1) <- gsub("\\.\\.\\.\\.", ".", names(d1))
d1; names(d1)
names(d1) <- gsub("\\.\\.\\.", ".", names(d1))
d1; names(d1)

# replace mulitple periods with a single one - better way
d1 <- data.frame(id...of....patient = c(1, 2), patient....age = c(1, 2))
d1; names(d1)
names(d1) <- gsub("\\.+", ".", names(d1))
d1; names(d1)

# metacharacters & their meaning
# "." matches everything except for the empty sting ""
# "+" the preceding item will be matched one or more times
# "*" the preceding item will be matched zero or more times
# "^" matches the empty string at the beginning of a line
# When used in a character class
# means to match any character but the following ones
# "$" matches empty string at the end of a line
# "|" infix operator: OR
# "(", ")" brackets for grouping
# "[", "]" character class brackets

### character class
# strings containing letter or digits only
# denoted by square brackets

# replace all values that do not contain letters or digits
# with NA value
d <- data.frame(id = c(11, 22, 33, 44, 55, 66, 77, 88),
                drug = c("vitamin E", "vitamin ESTER-C", 
                         " vitamin E ", "vitamin E(ointment)",
                         "", "vitamin E ", "provitamin E\n",
                         "vit E"),
                text = c("", "  ", "3 times a day after a meal",
                         "once a day", "       ",
                         "  one per day ", "\t", "\n  "),
                stringAsFactors = FALSE)
d
s <- d$text
unique(s)
s[s == "" | s == "  " | s == "       " | s == "\t" | s == "\n  "] <- NA
s

# [nco] matches any string containing any of the characters "n", "c", "o"
grep("[nco]", c("nose", "letter38", "window9", "apple0"), value = TRUE)
grep("[01234567]", c("nose", "letter38", "window9", "apple0"), value = TRUE)
grep("[0-7]", c("nose", "letter38", "window9", "apple0"), value = TRUE)
# examples of character classes:
# "[0-9]" - Digits
# "[a-z]" - Lower-case letters
# "[A-Z]" - Upper-case letters
# "[a-zA-Z]" - Alphabetic characters
# "[^a-zA-Z]" - Non-alphabetic characters
# "[a-zA-Z0-9]" - Alphanumeric characters
# "[ \t\n\r\f\v]" - Space characters
# "[]$*+.?[^{|(\\#%&~_/<=>'!,:;`\")}@-]" - Punctuation Characters

d <- data.frame(id = c(11, 22, 33, 44, 55, 66, 77, 88),
                drug = c("vitamin E", "vitamin ESTER-C", 
                         " vitamin E ", "vitamin E(ointment)",
                         "", "vitamin E ", "provitamin E\n",
                         "vit E"),
                text = c("", "  ", "3 times a day after a meal",
                         "once a day", "       ",
                         "  one per day ", "\t", "\n  "),
                stringAsFactors = FALSE)
d
s <- d$text; s
allIndices <- 1:length(s)
letOrDigIndices <- grep("[a-zA-Z0-9]", s)
blandInd <- setdiff(allIndices, letOrDigIndices)
s[blandInd] <- NA
s

# try this too to get rid of extra blank spaces
s = gsub("^([ \t\n\r\f\v]+)|([ \t\n\r\f\v]+)$", "", s)
s = gsub("^$", NA, s); s
