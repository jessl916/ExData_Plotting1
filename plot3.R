## plot3: plot the third chart

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
png(filename="plot3.png",width=480,height=480)

## plot 3, no labels and ticks for x and y axis
with(data_plot,plot(Sub_metering_1,type="l",col="black",
                    ylab="Energy sub metering",yaxt="n",
                    xaxt="n",xlab=""))
with(data_plot,lines(Sub_metering_2,type="l",col="red"))
with(data_plot,lines(Sub_metering_3,type="l",col="blue"))
### determine the tick locations
locationX <- c(which(data_plot$Time == "00:00:00"),nrow(data_plot)) 
locationY <- c(0,10,20,30)
## add x and y ticks and labels
axis(side=1,at=locationX,labels=c("Thu","Fri","Sat"))
axis(sid=2,at=locationY,labels=c("0","10","20","30"))
## add legend, with border
legend("topright",legend=c("Sub_metering_1",
                           "Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1,
       border = "black")

## close the device
dev.off()

