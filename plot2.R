# Load packages
library(readr);library(dplyr); library(lubridate)

# Create an object file name and read file
data_file <- ("~/Coursera/Explorary_Data_Analysis/household_power_consumption.txt")
data <- read.delim(data_file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, nrows = 2075259, check.names = F, comment.char = "",quote = "\"")

# Subset power consumption data into specific date range from the character string
sub_power <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#convert character string into date and paste time as well
date_time <- strptime(paste(sub_power$Date,sub_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
g_active <- as.numeric(sub_power$Global_active_power)

#use base plot function 
png("plot2.png", width=480, height=480)
plot(date_time, g_active, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()