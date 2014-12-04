#Plot 2 for Assignment 1
library(chron)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "HouseholdPower.zip")
energy <- read.table(unzip("HouseholdPower.zip", "household_power_consumption.txt"), 
                     header = T, nrow = 400000, sep = ";", na.strings = "?")
energy$Time <- chron(times = energy$Time)
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")
Feb <- subset(energy, Date == '2007-02-01' | Date == '2007-02-02')

concat <- paste(Feb$Date, Feb$Time,sep=' ') # concatenating date and time to convert it to a time format
totime <- strptime(concat,"%Y-%m-%d %H:%M:%S")
Feb2 <- cbind(Feb, totime)

png(filename = "Plot2.png",  width = 480, height = 480, units = "px")
plot(Feb2$totime, Feb2$Global_active_power, ylab = "Global Active Power (kilowatts)", 
     lwd = 1, type = "n", xlab = "")
lines(Feb2$totime, Feb2$Global_active_power)
dev.off()