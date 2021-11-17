
# After you have installed R and RStudio #
# Try to run this script #

# install it only once, after you done it, you can discard this code line #
install.packages("tidyverse")
install.packages("readxl")
install.packages("haven")

#
library(tidyverse)
library(haven)
library(readxl)
#

# where is my folder PATH?
getwd()

# set your folder PATH if you want
# for MAC you can do #
setwd(dir = "~/Desktop/")
#

# addition +
# substraction -
# multiplication *
# division /

((5 + 1 - 2) * 3) / 2

# base functions #
exp(2)
log(10) # natural logarithm
log10(10)
log2(2)
#

# Example: list of 5 people's age
# symbol `=` or `<-` allows you to create vectors or store values
data = c(22, 27, 30, 36, 40)
data <- c(22, 27, 30, 36, 40)

# mean
mean(data)

x = (((2 + 3) * 3)^2) / 10

# instead you can
x1 = (2 + 3)
x2 = x1 * 3
x3 = (x2)^2
x4 = (x3)/10
#

x = "hello"
y = 10

class(x)
class(y)

################################################################################################
# Swiss Dataset
################################################################################################

data(swiss)
swiss 

library(tidyverse)
library(haven)
library(stats)

# Let's select the first 5 rows and first 3 columns
# 1:5 = 1 to 5
swiss[1:5, 1:3]

# select row 2
swiss[2, ]

# you can access columns with the $ dollar symbol 
swiss$Agriculture

# for several columns
swiss[, c("Agriculture", "Catholic")]

# Percentage of agricultures in each city
# goes from 0 to 100 %

# let's select more than 70%
swiss$Agriculture > 70

# The column condition into the rows
swiss[swiss$Agriculture > 70, 1:3]

# we need to save this condition into a new variable called agri_dummy
swiss$agri_dummy = ifelse(test = swiss$Agriculture > 70, yes = 1, no = 0)

# group_by # summarise # mean
swiss %>% group_by(agri_dummy) %>% dplyr::summarise(mean(Fertility))
#

#
swiss %>% group_by(agri_dummy) %>% dplyr::summarise(median(Fertility), max(Fertility))
#

cor(swiss$Fertility, swiss$Catholic)
