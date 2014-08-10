## Retrieve dataset from file
## Cells separated by ';'
## NA cells are represented by '?'

powerData <- read.table("D:\\Documents\\household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

## Subsetting the data to specified date range
data <- subset(powerData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerData)

## Combining Date and Time for Plot 2
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Generate Plot 2
plot(data$Global_active_power ~ data$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving the image to file (stored at same directory with dataset)
dev.copy(png, file="D:\\Documents\\plot2.png", height=480, width=480)
dev.off()