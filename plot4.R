data <- read.csv("data.txt",na.strings="?", sep=";")
data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#needed data
data <- data[data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]
with(data,
{
  png('plot4.png')
  par(mfrow= c(2,2))
  
  plot(dateTime, 
       Global_active_power, 
       type="l",
       ylab="Global Active Power",
       xlab="")
  plot(dateTime, 
       Voltage, 
       type="l",
       ylab="Voltage",
       xlab="datetime")
  plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(dateTime, Sub_metering_2, type="l", col="red")
  points(dateTime, Sub_metering_3, type="l", col="blue")
  legend("topright",bty="n" ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
  plot(dateTime, 
       Global_reactive_power, 
       type="l",
       xlab="datetime")
  dev.off()
}
     )

