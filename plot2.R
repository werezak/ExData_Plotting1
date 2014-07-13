# Project 1 - Plot 2
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

png("plot2.png")

par(mar=c(4,4,4,4))

plot(power.select$datetime, power.select$gap.kw, type="l",
     ylab="Global Active Power (kilowatts)",xlab="")


dev.off()



