# Project 1 - Plot 4
#
# R. Werezak 13JUL2014

# Loading the data ...

setwd("/home/user/Projects/DataScience/ExploratoryDataAnalysis/Project1/")
unzip("exdata_data_household_power_consumption.zip")

power <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

power$mydate <- as.Date(power$Date,"%d/%m/%Y")

power.select <- power[power$mydate>="2007-02-01" & power$mydate<="2007-02-02",]

power <- 0 

power.select$date_and_time <- paste(power.select$Date, power.select$Time)
head(power.select$date_and_time)

power.select$datetime <- strptime(power.select$date_and_time,format="%d/%m/%Y %H:%M:%s")
head(power.select$datetime)

# Making Plots ...

# Plot 1 ...

power.select$gap.kw = as.numeric(power.select$Global_active_power)

png("plot4.png")

par(mar=c(4,4,4,2))

par(mfcol=c(2,2))

# first plot

plot(power.select$datetime, power.select$gap.kw, type="l",
     ylab="Global Active Power",xlab="")

# second plot

plot(power.select$datetime, power.select$Sub_metering_1, type="l",
     ylab="Energy sub metering",xlab="")
lines(power.select$datetime, power.select$Sub_metering_2, col="red")
lines(power.select$datetime, power.select$Sub_metering_3, col="blue")

# add the bty="n" option to remove the border
# use the cex scale factor to try to match the legend size in the example

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n",cex=0.95)

# third plot

plot(power.select$datetime, power.select$Voltage, type="l",
     ylab="Voltage",xlab="datetime")

# fourth plot

plot(power.select$datetime, power.select$Global_reactive_power, type="l",
     ylab="Global_reactive_power",xlab="datetime")

dev.off()

