# Set working directory
setwd("X:/Coursera/ExDataAnalysis")

power <- read.table("./household_power_consumption.txt", header=T, sep=";")

# Format dates correctly
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# Create subset of data
dates <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

# remove original dataset since it takes up too much space
rm(power)

# convert the numeric data from factor to character to numeric.
for (i in 3:9)
{
  dates[,i] <- as.numeric(as.character(dates[,i]))
}

# set up so that 4 'subplots' can be viewed in one plot)
png("./plot4.png",480,480,"px")
par(mfrow=c(2,2))

# First plot
plot.ts(dates$Global_active_power, ann=F, xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
title(ylab="Global Active Power")

# Second plot
plot.ts(dates$Voltage, ann=F, xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
title(ylab="Voltage")

# Third plot
plot.ts(dates$Sub_metering_1, ann=F, axes=F)
lines(dates$Sub_metering_2,col="red")
lines(dates$Sub_metering_3, col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
title(ylab="Energy sub metering")
legend("topright",40,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","blue","red")
       ,lty=1
       ,bty="n")
box()

# fourth plot
plot.ts(dates$Global_reactive_power, ann=F, xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
title(ylab="Global_reactive_power")
dev.off()
