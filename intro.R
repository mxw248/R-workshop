# asking for help
?sqrt
sqrt(9)
?round
args(round)
help.search("anova") # Analogous to searching in Help window
weight_kg <- 55 # assignment operator to specify variable
2.2 * weight_kg
weight_lb <- 2.2 * weight_kg
# vectors and other data types
weights <- c(50,60,65,82)
weights
animals <- c('rat','dog','mouse')
length(weights) # find number of values in vector
length(animals)
class(animals)
str(weights)
weights <- c(weights, 90) # adding value to end of vector

# remove everything in environment
rm(list=ls())

# download data
download.file("http://k8hertweck.github.io/2015-11-19-umiami-R/data/gapminder-FiveYearData.csv", "data/gapminder.csv")
# import or load data into R
gapminder <- read.csv("data/gapminder.csv")
str(gapminder)

# manipulating data
# extract first row, first column
gapminder[1,1] # name of object [first row of first column]
gapminder[2:6,1:2] # slice of data
gapminder[c(2,7,10), c(1,2)] # select non-contiguous values
gapminder[5, ]
lifeExp <- gapminder[ ,5]
mean(gapminder$lifeExp)

# apply function across selected rows
# row = 1, column = 2
averageColumns <- apply(gapminder[ ,c(3,5,6)], 2, mean)
averageColumns

# creating functions
g2kg <- function(x) x/1000
g2kg(5) # test function

se <- function(x) sd(x)/sqrt(length(x))
se2 <- function(x) sqrt(var(x)/length(x)) #var = variance
se(weights)
weights <- c(50,60,70,80)
se(weights)
se2(weights)

# make a plot
plot(gapminder$year, gapminder$lifeExp, xlab="year", ylab="Life expectancy")
pdf("figures/figure1.pdf")
dev.off()

# running statistical tests
help.search("anova")

# ANOVA
fit <- aov(lifeExp ~ country, data=gapminder) #fit model
fit
summary(fit)

data(sleep)

# unpaired t test
head(sleep)
t.test(extra ~ group, data=sleep) #numerical in relation to categorical

# paired t test
with(sleep, t.test(extra[group == 1],extra[group == 2], paired=TRUE)) # categorical variables are separated and compared

instal.packages("dplyr")
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
