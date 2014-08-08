setwd("~")
EPCData <- read.table("downloads/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
EPCData$Date <- as.Date(EPCData$Date, format = "%d/%m/%Y")
newdata <- subset(EPCData, Date == "2007-02-01" | Date == "2007-02-02")
newdata$DT <- as.POSIXct(paste(newdata$Date, newdata$Time), format = "%Y-%m-%d %H:%M:%S")
setwd("desktop/coursera/ExData_Plotting1")
png(file = "plot4.png", bg = "transparent")
par(mar = c(4,4,2,2), mfrow = c(2,2))
## plot4 consists of 4 plots. the first one is actually plot2
with(newdata, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
## the second one is between DT and Voltage
with(newdata, plot(DT, Voltage, type = "l", xlab = "datetime"))
## the third one is literally plot3, so I copied the code here
with(newdata, plot(DT, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(newdata, points(DT, Sub_metering_2, type = "l", col = "red"))
with(newdata, points(DT, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = c(1,1), col = c("black", "red","blue"))
## the fourth one is new
with(newdata, plot(DT, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()
