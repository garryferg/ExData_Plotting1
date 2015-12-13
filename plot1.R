
# Read data from file on local machine (after first downloading zip and extracting file)
all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
# Filter out all but the two days we are interested in
data <- all[all$Date=='1/2/2007' | all$Date=='2/2/2007',]

# Plot 1
png("plot1.png")

# Simple histogram setting color and titles
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Close png device to write image to disk
dev.off()

