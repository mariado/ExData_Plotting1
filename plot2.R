# read data
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Convert date and time variables
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

# Subset required data 
final_data <- subset(power_data, power_data$Date > "2007-01-31" & power_data$Date < "2007-02-03")
final_data$Global_active_power <- as.numeric(as.character(final_data$Global_active_power))

# Convert datetime format
date <- final_data$Date
time <- final_data$Time
date_time <- as.POSIXct(paste(as.character(date),as.character(time)))
final_data$DateTime <- date_time

# Output into png
png("plot2.png", width=480, height=480)
plot(final_data$DateTime, 
     final_data$Global_active_power, 
     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
dev.off()
