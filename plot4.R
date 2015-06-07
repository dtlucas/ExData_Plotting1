##From previous
dataAll <- "~/Documents/Coursera/household_power_consumption.txt"
data <- read.table(dataAll, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dataSmall <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(paste(dataSmall$Date, dataSmall$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSmall$Global_active_power)
subMetering1 <- as.numeric(dataSmall$Sub_metering_1)
subMetering2 <- as.numeric(dataSmall$Sub_metering_2)
subMetering3 <- as.numeric(dataSmall$Sub_metering_3)


##New Variables
voltage <- as.numeric(dataSmall$Voltage)
globalReactivePower <- as.numeric(dataSmall$Global_reactive_power)


##Make the plots for 4

png("plot4.png", width=480, height=480)
par(mfrow= c(2,2))

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(dateTime, globalActivePower, type="l", xlab="dateTime", ylab="Voltage")

plot(dateTime, subMetering1, type="l", xlab="", ylab="energy submetering")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black","red", "blue"))

plot(dateTime, globalReactivePower, type="l", xlab="dateTime", ylab="Global_reactive_power")
dev.off()

