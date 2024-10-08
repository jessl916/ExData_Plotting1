## plot4: plot the fourth chart

## read the unzipped data downloaded through this link:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## load library
library(dplyr)

## read data
data <- read.table("household_power_consumption.txt",
                   na.strings = "?", sep=";",header=TRUE)
# names(data) ## show the variable names
## convert Date variables to date/time class
data$Date <- as.Date(data$Date,"%d/%m/%Y")
## select the data from the dates 2007-02-01 and 2007-02-02
data_plot <- filter(data, Date %in% c("2007-02-01", "2007-02-02"))

### determine the x tick locations for all plots
locationX <- c(which(data_plot$Time == "00:00:00"),nrow(data_plot)) 
labelX <- c("Thu","Fri","Sat")

## open a png device
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

## plot 4.1 - up left (same with plot2)
## no labels and ticks for x axis at first
with(data_plot,plot(Global_active_power,type="l",
                    ylab="Global Active Power(kilowatts)",
                    xaxt="n",xlab=""))
## add x ticks and labels
axis(side=1,at=locationX,labels=labelX)


## plot 4.2 - up right
## no ticks for x
with(data_plot,plot(Voltage,type="l",
                    ylab="Voltage",
                    xaxt="n",xlab="datetime"))
## add x ticks and labels
axis(side=1,at=locationX,labels=labelX)


## plot 4.3 - bottom left
## no labels and ticks for x and y axis at first
with(data_plot,plot(Sub_metering_1,type="l",col="black",
                    ylab="Energy sub metering",yaxt="n",
                    xaxt="n",xlab=""))
with(data_plot,lines(Sub_metering_2,type="l",col="red"))
with(data_plot,lines(Sub_metering_3,type="l",col="blue"))
### determine the y tick locations
locationY <- c(0,10,20,30)
## add ticks and labels
axis(side=1,at=locationX,labels=labelX)
axis(sid=2,at=locationY,labels=c("0","10","20","30"))
## add legend, no border
legend("topright",legend=c("Sub_metering_1",
                           "Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)


## plot 4.4 - bottom right
with(data_plot,plot(Global_reactive_power,type="l",
                    ylab="Global_reactive_power",
                    xaxt="n",xlab="datetime"))
## add x ticks and labels
axis(side=1,at=locationX,labels=labelX)


## close the device
dev.off()

