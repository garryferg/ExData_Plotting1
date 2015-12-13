
# Read data from file on local machine (after first downloading zip and extracting file)
all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
# Filter out all but the two days we are interested in
data <- all[all$Date=='1/2/2007' | all$Date=='2/2/2007',]
# Combine date and time into a "DateTime" column for convenience later
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


# Plot 3
png("plot3.png")

# Three line plots on the same chart
plot(data$DateTime, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
# And a legend to label the line colors
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), lty="solid")

# Close png device to write image to disk
dev.off()

