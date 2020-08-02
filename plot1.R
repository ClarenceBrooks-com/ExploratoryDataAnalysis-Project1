# plot1.R
# Data file is expected to be 
# in "data" subdirectory of current working directory.

dataFile <- "./data/household_power_consumption.txt"

# Read in the data.
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Use a subset of the data for Date in the specified date range.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Note: Use str(subSetData) to see structure if desired.  Not needed in the run.
# Use as.numeric to convert chr to numeric.
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Open "plot1.png" (in the current working directory) 
# as a png output device, with width = height = 480
png("plot1.png", width=480, height=480)
# Do a histogram of globalActivePower with red bars with 
# the specified main title and x-label and y-label.
# NOTE: Default # of breaks (bars) will be used.
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close output device.
dev.off()
