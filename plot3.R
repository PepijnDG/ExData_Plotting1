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

png(filename = "plot3.png", width = 480, height = 480)
plot(test$datetime, as.numeric(test$Sub_metering_1), type="l", ylab = "Energy sub metering", xlab = "", col="black")
lines(test$datetime, as.numeric(test$Sub_metering_2), col="red")
lines(test$datetime, as.numeric(test$Sub_metering_3), col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
dev.off()