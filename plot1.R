data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- transform(data, Date = strptime(Date, "%d/%m/%Y"))
START <- as.POSIXlt("2007-02-01")
END <- as.POSIXlt("2007-02-02")
FebData <- data[data$Date >= START & data$Date <= END,]
rm(data)
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(FebData$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()