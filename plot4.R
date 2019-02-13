## Reading in the downloaded data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Subsetting the data between the dates 1/2/2007 & 2/2/2007
dataS <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## Pasting the Date and Time columns together
dataS$DateTime <- as.POSIXct(paste(dataS$Date, dataS$Time), format="%d/%m/%Y %H:%M:%S")

## Construction of multiple plots
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,4,1))

with(dataS, {
  ## line plot of Global Active Power vs Date & Time
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  ## line plot of Voltage vs Date & Time
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  ## line plot of Energy sub metering vs Date & Time
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, type = "l", col = "red")
  lines(DateTime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 1)
  
  ## line plot of Global Reactive Power vs Date & Time
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()