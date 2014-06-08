plot4 <- function() {
  data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data2 <- subset(data, Date >= "2007-02-01")
  data3 <- subset(data2, Date <= "2007-02-02")
  data <- data3
  dates <- data$Date
  times <- data$Time
  x <- paste(dates, times)
  newTime <- strptime(x, "%Y-%m-%d %H:%M:%S")
  data$Time <- newTime
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  data$Voltage <- as.numeric(data$Voltage)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  par(mfrow = c(2,2)
  plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(data$Time, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(data$Time, data$Sub_metering_1, type = "l")
  points(data$Time, data$Sub_metering_2, type = "l", col = "red")
  points(data$Time, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", bty = "n", cex = 0.75, pch = "--", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(data$Time, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  dev.copy(png, file = "plot4.png")
  dev.off();
}