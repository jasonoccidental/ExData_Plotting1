## Retrieve dataset from file
## Cells separated by ';'
## NA cells are represented by '?'

powerData <- read.table("D:\\Documents\\household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

## Subsetting the data to specified date range
data <- subset(powerData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerData)

## Combining Date and Time for Plot 4
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Generate Plot 4 on windows screen
## This allows proper screen adjustment when saving to png
graphics.off()
windows(width=15, height=16, bg="white")
par(mfrow=c(2,2))

## Graph at Top Left
plot(data$Global_active_power ~ data$DateTime, type="l", xlab="", ylab="Global Active Power")

## Graph at Top Right
plot(data$Voltage ~ data$DateTime, type="l", xlab="datetime", ylab="Voltage")

## Graph at Bottom Left
plot(data$Sub_metering_1 ~ data$DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2 ~ data$DateTime, col="red")
lines(data$Sub_metering_3 ~ data$DateTime, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Graph at Bottom Right
plot(data$Global_reactive_power ~ data$DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saving the image to file (stored at same directory with dataset)
dev.copy(png, filename = "D:\\Documents\\plot4.png", width = 480, height = 480, bg = "white")
dev.off()