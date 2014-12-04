#Course Project 1, Plot 1
#data has been saved to the working directory
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "HouseholdPower.zip")
energy <- read.table(unzip("HouseholdPower.zip", "household_power_consumption.txt"), 
                     header = T, nrow = 400000, sep = ";", na.strings = "?")
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")
Feb <- subset(energy, Date == '2007-02-01' | Date == '2007-02-02')

png(filename = "Plot1.png")
hist(Feb$Global_active_power, ylim = c(0, 1200), breaks = 12, 
     xlab = "Global Active Power (killowatts)", main = "Global Active Power", 
     col = "red")
dev.off()
#save as Plot1.png
#code saved as Plot1.r

