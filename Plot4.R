library(chron)
#Plot 3, assignment 1
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

#This is panel 1 (plot 2)
png(filename = "Plot4.png",  width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

plot(Feb2$totime, Feb2$Global_active_power, ylab = "Global Active Power (kilowatts)", 
     lwd = 1, type = "n", xlab = "")
lines(Feb2$totime, Feb2$Global_active_power)

#panel 2 
plot(Feb2$totime, Feb2$Voltage, ylab = "Voltage", lwd = 1,  
     xlab = "DateTime", type = "n")
lines(Feb2$totime, Feb2$Voltage)

#panel 3
plot(Feb2$totime, Feb2$Sub_metering_1, ylab = "Energy sub metering", 
     type = "n", xlab = "")
lines(Feb2$totime, Feb2$Sub_metering_1)
lines(Feb2$totime, Feb2$Sub_metering_2, col = "Red")
lines(Feb2$totime, Feb2$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("Black", "Red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Panel 4
plot(Feb2$totime, Feb2$Global_reactive_power, lwd = 1,  
     xlab = "Date Time", type = "n")
lines(Feb2$totime, Feb2$Global_reactive_power)
dev.off()