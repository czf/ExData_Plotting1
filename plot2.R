data <- read.csv("data.txt",na.strings="?", sep=";")
data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#needed data
data <- data[data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]
png('plot2.png')
plot(data$dateTime, 
     data$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()