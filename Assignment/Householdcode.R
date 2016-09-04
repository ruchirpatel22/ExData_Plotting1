setwd("/Users/ruchirpatel/Documents/R/Assignment3/ExData_Plotting1/Assignment")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$headerDate <- as.Date(data$headerDate, "%d/%m/%Y")
start <- as.Date("2007-02-01")
finish <- as.Date("2007-02-02")

data1 <- subset(data, data$headerDate== start | data$headerDate == finish)

data1$Global_active_power[data1$Global_active_power=="?"] <- "0"
data1$Global_active_power <- as.numeric(data1$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(data1$Global_active_power, main = "Global Active Power", col = "red", xlab = "Globlal Active Power (kilowatts)")
dev.off()


datetime <- paste( data1$headerDate, data1$Time)
datetime <- as.POSIXct(datetime)
data1$date <- datetime

png("plot2.png", width=480, height=480)
plot(data1$Global_active_power ~ data1$date, type="l", ylab = "Global Active Power (kilowatts)", xlab =" ")
dev.off()

data1$Sub_metering_1<- as.numeric(data1$Sub_metering_1)

data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)
data1$Votage <- as.numeric((data1$Voltage))
data1[is.na(data1$Sub_metering_2)] <- 0
data1[is.na(data1$Sub_metering_3)] <- 0

png("plot3.png", width = 480, height = 480)
plot(data1$Sub_metering_1 ~ data1$date, type="l", ylab = "Energy sub metering", ylim = c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))
lines(data1$Sub_metering_2, type = "l", col = "red")
lines(data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))



png("plot4.png", width = 480, height = 480)
par(mar = rep(2, 4))
par(mfrow = c(2, 2))

plot(data1$Global_active_power ~ data1$date, type="l", ylab = "Global Active Power", xlab =" ")

plot(data1$date, data1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data1$Sub_metering_1 ~ data1$date, type="l", ylab = "Energy sub metering", ylim = c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))
lines(data1$Sub_metering_2, type = "l", col = "red")
lines(data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue", cex = 0.5))

plot(data1$date, data1$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()



