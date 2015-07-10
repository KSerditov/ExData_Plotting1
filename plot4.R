setwd(file.path(getwd(),"ExData_Plotting1"))

d <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";")

ds <- subset(d, Date == "1/2/2007"| Date == "2/2/2007")

ds$DateTime <- as.POSIXct(paste(ds$Date, ds$Time), format="%d/%m/%Y %H:%M:%S")

ds$Sub_metering_1 <- as.numeric(as.character(ds$Sub_metering_1))
ds$Sub_metering_2 <- as.numeric(as.character(ds$Sub_metering_2))
ds$Sub_metering_3 <- as.numeric(as.character(ds$Sub_metering_3))

ds$Global_active_power <- as.numeric(as.character(ds$Global_active_power))
ds$Global_reactive_power <- as.numeric(as.character(ds$Global_reactive_power))
ds$Voltage <- as.numeric(as.character(ds$Voltage))

png(filename="./plot4.png")

par(mfrow=c(2,2))

plot(ds$Global_active_power ~ ds$DateTime, type="l", xlab="", ylab="Global Active Power")

plot(ds$Voltage ~ ds$DateTime, type="l", xlab="datetime", ylab="Voltage")

with(ds, plot(Sub_metering_1 ~ DateTime, type="l", ylab="Energy sub metering", xlab=""))
with(ds, lines(Sub_metering_2 ~ DateTime, type="l", col="red"))
with(ds, lines(Sub_metering_3 ~ DateTime, type="l", col="blue"))
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(ds,plot(Global_reactive_power ~ ds$DateTime, type="l", xlab="datetime"))

dev.off()
