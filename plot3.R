setwd(file.path(getwd(),"ExData_Plotting1"))

d <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";")

ds <- subset(d, Date == "1/2/2007"| Date == "2/2/2007")

ds$DateTime <- as.POSIXct(paste(ds$Date, ds$Time), format="%d/%m/%Y %H:%M:%S")

ds$Sub_metering_1 <- as.numeric(as.character(ds$Sub_metering_1))
ds$Sub_metering_2 <- as.numeric(as.character(ds$Sub_metering_2))
ds$Sub_metering_3 <- as.numeric(as.character(ds$Sub_metering_3))

png(filename="./plot3.png")
with(ds, plot(Sub_metering_1 ~ DateTime, type="l", ylab="Energy sub metering", xlab=""))
with(ds, lines(Sub_metering_2 ~ DateTime, type="l", col="red"))
with(ds, lines(Sub_metering_3 ~ DateTime, type="l", col="blue"))
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
