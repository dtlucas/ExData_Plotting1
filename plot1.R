##Get full dataset
dataAll <- "~/Documents/Coursera/household_power_consumption.txt"
data <- read.table(dataAll, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subset the data
DataSmall <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Make the plot
globalActivePower <- as.numeric(DataSmall$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
