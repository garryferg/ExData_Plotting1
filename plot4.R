
# Read data from file on local machine (after first downloading zip and extracting file)
all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
# Filter out all but the two days we are interested in
data <- all[all$Date=='1/2/2007' | all$Date=='2/2/2007',]
# Combine date and time into a "DateTime" column for convenience later
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


# Plot 4
png("plot4.png")

# Use a 2 by 2 grid, column-first
par(mfcol = c(2,2))

#Top-left (same as plot 2 but with different axis label)
plot(data$DateTime, data$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

#Bottom-left (same as plot 3)
plot(data$DateTime, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), lty="solid")

#Top-right
plot(data$DateTime, data$Voltage, type="l",
     ylab="Voltage", xlab="datetime")

#Bottom-right
plot(data$DateTime, data$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")

# Close png device to write image to disk
dev.off()
