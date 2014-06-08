plot1 <- function() {
  data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data2 <- subset(data, Date >= "2007-02-01")
  data3 <- subset(data2, Date <= "2007-02-02")
  data <- data3
  data$Global_active_power <- as.numeric(data$Global_active_power)
  hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.copy(png, file = "post1.png")
  dev.off();
}