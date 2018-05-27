# Load packages
library(readr);library(dplyr)

# Create an object file name and read file
data_file <- ("~/Coursera/Explorary_Data_Analysis/household_power_consumption.txt")
data <- read.delim(data_file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, nrows = 2075259, check.names = F, comment.char = "",quote = "\"")

# Subset power consumption data into specific date range from the character string
sub_power <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")


#create PNG file
png("plot1.png", width = 480, height = 480)
#basic plot function
hist(as.numeric(as.character(sub_power$Global_active_power)), col ="red", main= "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.off()