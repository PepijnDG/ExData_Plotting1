test <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
test <- filter(test, Date == "1/2/2007" | Date == "2/2/2007")
test$datetime <- strptime(paste(test$Date, test$Time), format="%d/%m/%Y %H:%M:%S")

test$Global_active_power <- as.character(test$Global_active_power)
test$Global_active_power <- as.numeric(test$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(test$Global_active_power), main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowats)", col="red")

dev.off()