## plot1: plot the first chart

## read the unzipped data downloaded through this link:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## load library
library(dplyr)

## read data
data <- read.table("household_power_consumption.txt",
                   na.strings = "?", sep=";",header=TRUE)
names(data) ## show the variable names
## convert Date variables to date/time class
data$Date <- as.Date(data$Date,"%d/%m/%Y")
## select the data from the dates 2007-02-01 and 2007-02-02
data_plot <- filter(data, Date %in% c("2007-02-01", "2007-02-02"))

## open a png device
png(filename="plot1.png",width=480,height=480)

## plot according to the instruction
with(data_plot,hist(Global_active_power,col="red",
     xlab ="Global Active Power(kilowatts)",ylab="Frequency",
     main ="Global Active Power"))
## close the device
dev.off()
