data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- transform(data, Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
data <- transform(data, Date = strptime(Date, "%d/%m/%Y"))
START <- as.POSIXlt("2007-02-01")
END <- as.POSIXlt("2007-02-02")
FebData <- data[data$Date >= START & data$Date <= END,]
rm(data)
png(filename = "plot2.png", width = 480, height = 480)
with(FebData, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()