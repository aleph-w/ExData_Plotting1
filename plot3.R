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
dates$Sub_metering_1 <- as.numeric(as.character(dates$Sub_metering_1))
dates$Sub_metering_2 <- as.numeric(as.character(dates$Sub_metering_2))
dates$Sub_metering_3 <- as.numeric(as.character(dates$Sub_metering_3))

png("./plot3.png",480,480,"px")
plot.ts(dates$Sub_metering_1, ann=F, axes=F)
lines(dates$Sub_metering_2,col="red")
lines(dates$Sub_metering_3, col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
title(ylab="Energy sub metering")
legend(1875,40,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","blue","red")
       ,lty=1)
box()
dev.off()
