# Exercise 8: Pulitzer Prizes

# Read in the data
pulitzer <- read.csv("data/pulitzer-circulation-data.csv", stringsAsFactors = FALSE)

# Install and load the needed libraries
# Be sure to comment out the install.packages function so it won't install it every time it runs
# Remeber you only need to install a package once
#install.packages("dplyr")
library(dplyr)

# View in the data set. Start to understand what the data columns contains
# Be sure to comment out the function so it won't view everytime you run the code.
#View(pulitzer)

# Use 'colnames' to print out the names of the columns
colnames(pulitzer)

# Use 'str' to print what types of values are contained in each column
# Did any value type surprise you? Why do you think they are that type?
print(str(pulitzer))

# Add a column in a dataframe called 'Pulitzer.Prize.Change` that contains the diffrence in changes
# in Pulitzer Prize Winners from 2004 to 2014 and Pultizer Prize Winners from 1990 to 2003.
Pulitzer.Prize.Change <- mutate(pulitzer, difference.2004.2014.and.1990.2003 = 
                                Pulitzer.Prize.Winners.and.Finalists..2004.2014 -
                                Pulitzer.Prize.Winners.and.Finalists..1990.2003)

# What publication gained the most pulitzer prizes from 2004-2014?
# Be sure to use the pipe operator! 
most.prizes <- Pulitzer.Prize.Change %>%
  filter(difference.2004.2014.and.1990.2003 == max(difference.2004.2014.and.1990.2003)) %>%
  select(Newspaper)

# Which publication with at least 5 Pulitzers won from 2004-2014 had the biggest decrease(negative) in Daily circulation numbers? 
# This publication should have Pulitzer prizes won a minimum of 5 Pulitzers, as well as the biggest decrease in circulation
over.5.decrease <- Pulitzer.Prize.Change %>%
  filter(Pulitzer.Prize.Winners.and.Finalists..2004.2014 >= 5) %>%
  # we're comparing char though?
  filter(Change.in.Daily.Circulation..2004.2013 == min(Change.in.Daily.Circulation..2004.2013)) %>%
  select(Newspaper)

# Your turn! An important part about being a data scientist is asking questions. 
# Create a question and use dplyr to figure out the answer.
# Question: Which publication decreased in number of Pulitzer prizes won but increased
# their daily circulation the most from 2004?
increase.circulation.lost.prizes <- filter(Pulitzer.Prize.Change, difference.2004.2014.and.1990.2003 < 0) %>%
  filter(Change.in.Daily.Circulation..2004.2013 == max(Change.in.Daily.Circulation..2004.2013)) %>%
  select(Newspaper)

