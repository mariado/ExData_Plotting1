# read data
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Convert date and time variables
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

# Subset required data 
final_data <- subset(power_data, power_data$Date > "2007-01-31" & power_data$Date < "2007-02-03")
final_data$Global_active_power <- as.numeric(as.character(final_data$Global_active_power))

# Output into png
png("plot1.png", width=480, height=480)
hist(final_data$Global_active_power, 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col="red")
dev.off()


