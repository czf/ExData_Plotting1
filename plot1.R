data <- read.csv("data.txt",na.strings="?", sep=";")
data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#needed data
data <- data[data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]
png("plog1.png")
hist(data$Global_active_power, 
     freq=TRUE, 
     col="red",
     main="Global Active Power",
     ylab="Frequency",
     xlab="Global Active Power (kilowatts)"
     )
dev.off()