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
png("./plot2.png",480,480,"px")
plot.ts(dates$Global_active_power, ann=F, xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
title(ylab="Global Active Power (kilowatts)")
dev.off()
