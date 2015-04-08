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
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Plot [1,1]
plot(final_data$DateTime, 
     final_data$Global_active_power, 
     type="l",
     ylab="Global Active Power",
     xlab="")

# Plot [1,2]
plot(final_data$DateTime, 
     final_data$Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# Plot [2,1]
plot(final_data$DateTime, 
     final_data$Sub_metering_1, 
     type="l", 
     yaxt="n",
     ylim=c(0,35),
     xlab="", 
     ylab="Energy sub metering")

axis(2, at=seq(0,35,by=10), labels = c(0,10,20,30))

lines(final_data$DateTime,
      final_data$Sub_metering_2,
      col="red")

lines(final_data$DateTime,
      final_data$Sub_metering_3,
      col="blue")

legend("topright", 
       paste(c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")), 
       col = c("black", "red", "blue"), 
       lty=1, 
       ncol = 1,
       bty="n")

# Plot [2,2]
final_data$Global_reactive_power <- as.numeric(as.character(final_data$Global_reactive_power))
plot(final_data$DateTime, 
     final_data$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()

