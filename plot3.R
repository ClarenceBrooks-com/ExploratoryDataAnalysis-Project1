# plot3.R
# Data file is expected to be 
# in "data" subdirectory of current working directory.

dataFile <- "./data/household_power_consumption.txt"

# Read in the data.
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Use a subset of the data for Date in the specified date range.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Note: Use str(subSetData) to see structure if desired.  Not needed in the run.
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Use as.numeric to convert chr to numeric.
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Open "plot3.png" (in the current working directory) 
# as a png output device, with width = height = 480
png("plot3.png", width=480, height=480)
# Set y-label to "Energy Submetering" and x-label to blank 
# and plot subMetering1 vs. datetime data in black (default).
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
# Now add subMetering2 vs. datetime data to the plot in red.
lines(datetime, subMetering2, type="l", col="red")
# Now add subMetering3 vs. datetime data to the plot in blue.
lines(datetime, subMetering3, type="l", col="blue")
# Add a legend to the top right of the plot.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close output device.
dev.off()