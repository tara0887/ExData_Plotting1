##initiating png file
png("plot4.png", width=480, height=480)

## Getting full dataset
hcp <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", stringsAsFactors = F)
hcp$Date <- as.Date(hcp$Date, format = "%d/%m/%Y")

## Subsetting the data
hcpData <- subset(hcp, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hcp)

## Converting dates
datetime <- paste(as.Date(hcpData$Date), hcpData$Time)
hcpData$DateTime <- as.POSIXct(datetime)

##setting the area for plots
par(mfrow = c(2,2))

## PLot 1
plot(hcpData$Global_active_power ~ hcpData$DateTime, type = "l", xlab = "",
     ylab = "Global Active Power (Kilowatts)")

##plot2
plot(hcpData$Voltage ~ hcpData$DateTime, type = "l", ylab = "Voltage", xlab = "datetime")

##plot3
plot(hcpData$Sub_metering_1 ~ hcpData$DateTime, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(hcpData$Sub_metering_2 ~ hcpData$DateTime, col = "red")
lines(hcpData$Sub_metering_3 ~ hcpData$DateTime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), 
       col = c("black", "red", "blue"), cex = 0.5)

##plot4
plot(hcpData$Global_reactive_power ~ hcpData$DateTime, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
