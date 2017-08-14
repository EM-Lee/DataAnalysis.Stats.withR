year <- c(1987, 1992, 1997, 2002, 2007, 2012)
president <- c('TW Roh', 'YS Kim', 'DJ Kim', 'MH Roh', 'MB Lee', 'GH Park')
rate <- c(89.2, 81.9, 80.7, 70.8, 63.0, 75.8)

national.election <- data.frame(cbind(year, president, rate))
head(national.election)
nrow(national.election)
