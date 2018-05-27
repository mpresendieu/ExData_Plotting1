# Load packages
library(readr);library(dplyr); library(lubridate)

# Create an object file name and read file
data_file <- ("~/Coursera/Explorary_Data_Analysis/household_power_consumption.txt")
data <- read.delim(data_file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, nrows = 2075259, check.names = F, comment.char = "",quote = "\"")

# Subset power consumption data into specific date range from the character string
sub_power <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")


#convert character string into date and paste time as well
sub_power$date_time <- strptime(paste(sub_power$Date,sub_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(sub_power$Sub_metering_1)
subMetering2 <- as.numeric(sub_power$Sub_metering_2)
subMetering3 <- as.numeric(sub_power$Sub_metering_3)
g_active <- as.numeric(sub_power$Global_active_power)
volt <- as.numeric(sub_power$Voltage)
g_reactive <- as.numeric(sub_power$Global_reactive_power)


#create mult. view plot with par function
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1))
plot(sub_power$date_time, g_active, type = "l", ylab="Global Active Power", xlab="")
plot(sub_power$date_time, volt, type = "l", ylab="Voltage", xlab="datetime")
plot(sub_power$date_time, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(sub_power$date_time, subMetering2,col = "red")
lines(sub_power$date_time, subMetering3,col = "blue")  
legend("topright", lty = 1, lwd=2, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(sub_power$date_time, g_reactive, type = "l", ylab="Global_reactive_power", xlab="datetime")
dev.off()