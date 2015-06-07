##Get full dataset
dataAll <- "~/Documents/Coursera/household_power_consumption.txt"
data <- read.table(dataAll, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the data
dataSmall <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


##Convert dates and times
dateTime <- strptime(paste(dataSmall$Date, dataSmall$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSmall$Global_active_power)


##Make the plot
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

