# plot2.R
# Data file is expected to be 
# in "data" subdirectory of current working directory.dataFile <- "./data/household_power_consumption.txt"

dataFile <- "./data/household_power_consumption.txt"

# Read in the data.
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Use a subset of the data for Date in the specified date range.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Note: Use str(subSetData) to see structure if desired.  Not needed in the run.
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Use as.numeric to convert chr to numeric.
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Open "plot2.png" (in the current working directory) 
# as a png output device, with width = height = 480
png("plot2.png", width=480, height=480)
# Plot globalActivePower vs. datetime with specified x-label and y-label.
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close output device.
dev.off() 