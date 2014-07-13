# Project 1 - Plot 3
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

png("plot3.png")

par(mar=c(4,4,4,2))

plot(power.select$datetime, power.select$Sub_metering_1, type="l",
     ylab="Energy sub metering",xlab="")
lines(power.select$datetime, power.select$Sub_metering_2, col="red")
lines(power.select$datetime, power.select$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty=1)

dev.off()


