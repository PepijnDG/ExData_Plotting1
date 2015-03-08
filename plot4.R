library(dplyr)
Sys.setlocale("LC_TIME", "English")
test <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
test <- filter(test, Date == "1/2/2007" | Date == "2/2/2007")
test$datetime <- strptime(paste(test$Date, test$Time), format="%d/%m/%Y %H:%M:%S")

test$Sub_metering_1 <- as.character(test$Sub_metering_1)
test$Sub_metering_1 <- as.numeric(test$Sub_metering_1)

test$Sub_metering_2 <- as.character(test$Sub_metering_2)
test$Sub_metering_2 <- as.numeric(test$Sub_metering_2)

test$Sub_metering_3 <- as.character(test$Sub_metering_3)
test$Sub_metering_3 <- as.numeric(test$Sub_metering_3)

test$Global_active_power <- as.character(test$Global_active_power)
test$Global_active_power <- as.numeric(test$Global_active_power)

test$Global_reactive_power <- as.character(test$Global_reactive_power)
test$Global_reactive_power <- as.numeric(test$Global_reactive_power)

test$Voltage <- as.character(test$Voltage)
test$Voltage <- as.numeric(test$Voltage)

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(test$datetime, as.numeric(test$Global_active_power), type="l", ylab = "Global Active Power (kilowats)", xlab = "")

plot(test$datetime, as.numeric(test$Voltage), type="l", xlab = "datatime", ylab = "Voltage")

plot(test$datetime, as.numeric(test$Sub_metering_1), type="l", ylab = "Energy sub metering", xlab = "", col="black")
lines(test$datetime, as.numeric(test$Sub_metering_2), col="red")
lines(test$datetime, as.numeric(test$Sub_metering_3), col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=1, col = c("black", "red", "blue"))

plot(test$datetime, as.numeric(test$Global_reactive_power), type="l", xlab = "datatime", ylab = "Global_reactive_power")

dev.off()