##initiating png file
png("plot2.png", width=480, height=480)

## Getting full dataset
hcp <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", stringsAsFactors = F)
hcp$Date <- as.Date(hcp$Date, format = "%d/%m/%Y")

## Subsetting the data
hcpData <- subset(hcp, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hcp)

## Converting dates
datetime <- paste(as.Date(hcpData$Date), hcpData$Time)
hcpData$DateTime <- as.POSIXct(datetime)

##PLotting the chart
plot(hcpData$Global_active_power ~ hcpData$DateTime, type = "l", xlab = "",
     ylab = "Global Active Power (Kilowatts)")

dev.off()
