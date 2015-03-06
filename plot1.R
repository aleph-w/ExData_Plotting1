# Set working directory
setwd("X:/Coursera/ExDataAnalysis")

power <- read.table("./household_power_consumption.txt", header=T, sep=";")

# Format dates correctly
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# Create subset of data
dates <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

# remove original dataset since it takes up too much space
rm(power)

# convert the data from factor to character to numeric.
dates$Global_active_power <- as.numeric(as.character(dates$Global_active_power))

# Create and save plot
png("./plot1.png",480,480,"px")
hist(as.numeric(dates$Global_active_power), main="Global Active Power"
     , xlab = "Global Active Power (kilowatts)", col="red", cex=0.8)
dev.off()
