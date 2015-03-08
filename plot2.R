library(dplyr)
Sys.setlocale("LC_TIME", "English")
test <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
test <- filter(test, Date == "1/2/2007" | Date == "2/2/2007")
test$datetime <- strptime(paste(test$Date, test$Time), format="%d/%m/%Y %H:%M:%S")

test$Global_active_power <- as.character(test$Global_active_power)
test$Global_active_power <- as.numeric(test$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480)
plot(test$datetime, as.numeric(test$Global_active_power), type="l", ylab = "Global Active Power (kilowats)", xlab = "")
dev.off()