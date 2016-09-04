setwd("/Users/ruchirpatel/Documents/R/Assignment3/ExData_Plotting1/Assignment")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$headerDate <- as.Date(data$headerDate, "%d/%m/%Y")
start <- as.Date("2007-02-01")
finish <- as.Date("2007-02-02")

data1 <- subset(data, data$headerDate== start | data$headerDate == finish)

data1$Global_active_power[data1$Global_active_power=="?"] <- "0"
data1$Global_active_power <- as.numeric(data1$Global_active_power)

datetime <- paste( data1$headerDate, data1$Time)
datetime <- as.POSIXct(datetime)
data1$date <- datetime

png("plot2.png", width=480, height=480)
plot(data1$Global_active_power ~ data1$date, type="l", ylab = "Global Active Power (kilowatts)", xlab =" ")
dev.off()
