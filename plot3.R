data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- transform(data, Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
data <- transform(data, Date = strptime(Date, "%d/%m/%Y"))
START <- as.POSIXlt("2007-02-01")
END <- as.POSIXlt("2007-02-02")
FebData <- data[data$Date >= START & data$Date <= END,]
rm(data)
png(filename = "plot3.png", width = 480, height = 480)
with(FebData, {plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering");
               points(Time, Sub_metering_1, type = "l", col = "black");
               points(Time, Sub_metering_2, type = "l", col = "red");
               points(Time, Sub_metering_3, type = "l", col = "blue");
               legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  })
dev.off()