setwd("~")
EPCData <- read.table("downloads/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
EPCData$Date <- as.Date(EPCData$Date, format = "%d/%m/%Y")
newdata <- subset(EPCData, Date == "2007-02-01" | Date == "2007-02-02")
newdata$DT <- as.POSIXct(paste(newdata$Date, newdata$Time), format = "%Y-%m-%d %H:%M:%S")
setwd("desktop/coursera/ExData_Plotting1")
png(file = "plot3.png", bg = "transparent")
with(newdata, plot(DT, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(newdata, points(DT, Sub_metering_2, type = "l", col = "red"))
with(newdata, points(DT, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black", "red","blue"))
dev.off()