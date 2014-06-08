plot2 <- function() {
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
  plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")  dev.copy(png, file = "plot2.png")
  dev.copy(png, file = "plot2.png")
  dev.off();
}