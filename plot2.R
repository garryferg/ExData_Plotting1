
# Read data from file on local machine (after first downloading zip and extracting file)
all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
# Filter out all but the two days we are interested in
data <- all[all$Date=='1/2/2007' | all$Date=='2/2/2007',]

# Combine date and time into a "DateTime" column for convenience later
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 2
png("plot2.png")

# A line plot (type="l") with y-axis label set and no x-axis label
plot(data$DateTime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Close png device to write image to disk
dev.off()
