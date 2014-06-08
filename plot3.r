plot3 <- function() {
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
  plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(data$Time, data$Sub_metering_1, type = "l")
  points(data$Time, data$Sub_metering_2, type = "l", col = "red")
  points(data$Time, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", pch = "--", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.copy(png, file = "plot3.png")
  dev.off();
}