## Reading in the downloaded data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Subsetting the data between the dates 1/2/2007 & 2/2/2007
dataS <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## Pasting the Date and Time columns together
dataS$DateTime <- as.POSIXct(paste(dataS$Date, dataS$Time), format="%d/%m/%Y %H:%M:%S")
  
## Construction of histogram plot of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(dataS$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()