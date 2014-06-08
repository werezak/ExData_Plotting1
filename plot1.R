# Project 1 - Plot 1
#
# R. Werezak

# Loading the data ...

setwd("/home/user/Projects/DataScience/ExploratoryDataAnalysis/Project1/")
unzip("exdata_data_household_power_consumption.zip")

power <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

power$mydate <- as.Date(power$Date,"%d/%m/%Y")

power.select <- power[power$mydate>="2007-02-01" & power$mydate<="2007-02-02",]

power <- 0

# Making Plots ...

# Plot 1 ...

power.select$gap.kw = as.numeric(power.select$Global_active_power)

png("plot1.png")

hist(power.select$gap.kw,xlab="Global Active Power (kilowatts)",col=rgb(1,0,0),main="Global Active Power")

dev.off()
