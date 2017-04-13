# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# Install (if you haven't already) and load the `dplyr`package
library(dplyr)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
one.year <- unique(vehicles.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.more.than.20mpg <- filter(vehicles, drive == '2-Wheel Drive', cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
# filter from the 2-Wheel drive/more than 20 mpg the lowest highway mpg.
# Then select the id
lowest.hwy.mpg <- filter(two.wheel.more.than.20mpg, hwy == min(hwy))
worst.hwy.id <- select(lowest.hwy.mpg, id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostHwyMPG <- function(select.year, select.make) {
  filtered.year.make <- filter(vehicles, year == select.year, make == select.make)
  return(filter(filtered.year.make, hwy == max(hwy)))
}


# What was the most efficient honda model of 1995?
efficient.honda.1995 <- MostHwyMPG(1995, 'Honda')

