
setwd("C:/Users/e79309/Documents/Coursera_DataScience/4.ExploratoryDataAnalysis/Week1")
power <- read.table("./household_power_consumption.txt", sep=";", dec=".", header=TRUE)
head(power)
power$datetime <- paste(power$Date, power$Time)
power$Date2 <- strptime(as.Date(power$Date), "%d/%m/%y")

subset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
dim(subset)
head(subset)

## plot4
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(subset$datetime2,as.numeric(as.character(subset$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
plot(subset$datetime2, as.numeric(as.character(subset$Voltage)), type="l", xlab="datetime", ylab="voltage")
plot(subset$datetime2, as.numeric(as.character(subset$Sub_metering_1)), type="n", xlab="", ylab="Energy sub metering")
points(subset$datetime2, as.numeric(as.character(subset$Sub_metering_1)), type="l")
points(subset$datetime2, as.numeric(as.character(subset$Sub_metering_2)), type="l", col="red")
points(subset$datetime2, as.numeric(as.character(subset$Sub_metering_3)), type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
plot(subset$datetime2, as.numeric(as.character(subset$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
par(mfrow=c(1,1))
