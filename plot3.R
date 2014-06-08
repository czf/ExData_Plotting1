data <- read.csv("data.txt",na.strings="?", sep=";")
data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#needed data
data <- data[data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]
png('plot3.png')
plot(data$dateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(data$dateTime, data$Sub_metering_2, type="l", col="red")
points(data$dateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()