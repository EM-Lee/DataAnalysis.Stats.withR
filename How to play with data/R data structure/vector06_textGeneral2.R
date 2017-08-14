### wrangling character data and using regular expressions
# http://stat545.com/block028_character-data.html
# http://www.gapminder.org/data/
# http://r4ds.had.co.nz/strings.html
# http://uc-r.github.io/regex_syntax
# https://www.stat.auckland.ac.nz/~paul/ItDT/HTML/node84.html

rm(list = ls())

install.packages("tidyverse")
library(tidyverse)
library(stringr)

### basic string manipulation tasks
# fruit, words, and sentences are character vectors
# that ship with stringr for practicing
fruit; str(fruit); typeof(fruit)
words; str(words); typeof(words)
sentences; str(sentences); typeof(sentences)

# detect or filter on a target string
str_detect(fruit, "fruit") #Which fruits actually use the word "fruit"?
fruit[str_detect(fruit, "fruit") == TRUE]
match(fruit[str_detect(fruit, "fruit") == TRUE], fruit)
which(fruit %in% fruit[str_detect(fruit, "fruit") == TRUE])

my_fruit <- str_subset(fruit, "fruit"); my_fruit
match(my_fruit, fruit) #match returns the first encounter of a match
which(fruit %in% my_fruit) #for multiple matching

# string splitting by delimiter
str_split(my_fruit, "")
str_split(my_fruit, " ")
str_split_fixed(my_fruit, "", n = Inf)
str_split_fixed(my_fruit, " ", n = 2)

my_fruit_df <- tibble(my_fruit); my_fruit_df
my_fruit_df %>% 
  separate(my_fruit, into = c("pre", "post"), sep = " ")
# about the pipe operators
# https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html
# https://martinsbioblogg.wordpress.com/2014/03/27/more-fun-with-and/
# http://r4ds.had.co.nz/pipes.html
# http://moderndata.plot.ly/using-the-pipe-operator-in-r-with-plotly/

# substring extraction & replacement
length(my_fruit)
str_length(my_fruit)

head(fruit) %>%
  str_sub(1, 3)

tibble(fruit) %>%
  head() %>%
  mutate(snip = str_sub(fruit, 1:6, 3:8))

x <- head(fruit, 3); x
str_sub(x, 1, 3) <- "AAA"; x

# collapse a vector
head(fruit) %>%
  str_c(collapse = ", ")

# catenating
str_c(fruit[1:4], fruit[5:8], sep = " & ")
str_c(fruit[1:4], fruit[5:8], sep = " & ", collapse = ", ")

fruit_df <- tibble(fruit1 = fruit[1:4], fruit2 = fruit[5:8])
fruit_df %>%
  unite("falvor_combo", fruit1, fruit2, sep = " & ")

# substring replacement
str_replace(my_fruit, "fruit", "THINGY")

melons <- str_subset(fruit, "melon"); melons
melons[2] <- NA; melons
str_replace_na(melons, "UNKNOWN MELON")

tibble(melons) %>%
  replace_na(replace = list(melons = "UNKNOW MELON"))

# pattern
# use gapminder data package
# https://cran.r-project.org/web/packages/gapminder/README.html
install.packages("gapminder")
library(gapminder)
gapminder; str(gapminder)
names(gapminder); colnames(gapminder); ncol(gapminder); nrow(gapminder)

countries <- levels(gapminder$country); countries
attach(gapminder); country

str_subset(countries, "i.a")
# ., which stands for any single character,
# except a newline (which by the way, is represented by \n)
str_subset(countries, "r.a")

str_subset(countries, "i.a$")
str_subset(countries, "r.a$")
str_subset(countries, ".$")
str_subset(countries, "K")
str_subset(countries, "Korea")

my_fruit
str_subset(my_fruit, "d")
str_subset(my_fruit, "^d")

fruit
str_subset(fruit, "melon")
str_subset(fruit, "\\bmelon") #a word boundary
str_subset(fruit, "\\Bmelon") #not a word boundary

# character classes
str_subset(countries, "[nls]ia$")
str_subset(countries, "[^nls]ia$") #to negate the class
str_subset(countries, "[or]ea")

my_fruit
str_split_fixed(my_fruit, " ", 2)
str_split_fixed(my_fruit, "\\s", 2)
str_split_fixed(my_fruit, "[[:space:]]", 2)

str_subset(countries, "[[:punct:]]") #country names that contain punctuation

### quantifiers
# *	0 or more
# +	1 or more
# ?	0 or 1
# {n}	exactly n
# {n,}	at least n
# {,m}	at most m
# {n,m}	between n and m, inclusive
# l.*e will match strings with 0 or more characters in between,
# i.e. any string with an l eventually followed by an e
# the most inclusive regex

fruit
matches <- str_subset(fruit, "l.*e"); matches
str_subset(fruit, "l.+e")

match <- intersect(matches, str_subset(fruit, "l.+e"))
no_match <- setdiff(matches, str_subset(fruit, "l.+e"))
list(match, no_match)

match <- intersect(matches, str_subset(fruit, "l.?e"))
no_match <- setdiff(matches, str_subset(fruit, "l.?e"))
list(match, no_match)

match <- intersect(matches, str_subset(fruit, "le"))
no_match <- setdiff(matches, str_subset(fruit, "le"))
list(match, no_match)

### escaping
# $ * + . ? [ ] ^ { } | ( ) \

# escapes in plain old strings
cat("Do you use \"airquotes\" much?") #to escape quotes inside quotes
print("Do you use \"airquotes\" much?")

cat("before the newline\nafter the newline")
cat("before the tab\tafter the tab")

# escapes in regular expressions
# We know several Gapminder country names contain a period.
# How do we isolate them? 
# Although it's tempting,
# this command str_subset(countries, ".") won't work!
str_subset(countries, ".")
str_subset(countries, "\\.")
str_subset(countries, "[[:punct:]]")

x <- c("whatever", "X is distributed U[0,1]"); x
str_subset(x, "\\[") #match an actual square bracket
