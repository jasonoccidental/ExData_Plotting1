## Retrieve dataset from file
## Cells separated by ';'
## NA cells are represented by '?'

powerData <- read.table("D:\\Documents\\household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

## Subsetting the data to specified date range
data <- subset(powerData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerData)

## Combining Date and Time for Plot 3
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Generate Plot 3 on windows screen
## This allows proper screen adjustment when saving to png
graphics.off()
windows(width=9, height=10, bg="white")
plot(data$Sub_metering_1 ~ data$DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2 ~ data$DateTime, col="red")
lines(data$Sub_metering_3 ~ data$DateTime, col="blue")

#Generate a legend for Plot 3
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving the image to file (stored at same directory with dataset)
dev.copy(png, filename = "D:\\Documents\\plot3.png", width = 480, height = 480, bg = "white")
dev.off()