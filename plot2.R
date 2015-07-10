setwd(file.path(getwd(),"ExData_Plotting1"))

d <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";")

ds <- subset(d, Date == "1/2/2007"| Date == "2/2/2007")

ds$DateTime <- as.POSIXct(paste(ds$Date, ds$Time), format="%d/%m/%Y %H:%M:%S")

ds$Global_active_power <- as.numeric(as.character(ds$Global_active_power))

png(filename="./plot2.png")
plot(ds$Global_active_power ~ ds$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
