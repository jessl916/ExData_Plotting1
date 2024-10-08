## plot2: plot the second chart

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
png(filename="plot2.png",width=480,height=480)

## plot 2 
## no labels and ticks for x axis at first
with(data_plot,plot(Global_active_power,type="l",
                    ylab="Global Active Power(kilowatts)",
                    xaxt="n",xlab=""))
### determine the tick locations
location <- c(which(data_plot$Time == "00:00:00"),nrow(data_plot)) 
## add x ticks and labels
axis(side=1,at=location,labels=c("Thu","Fri","Sat"))
## close the device
dev.off()

