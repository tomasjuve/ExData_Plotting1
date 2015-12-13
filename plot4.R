library(sqldf)
data<-read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE,sep=";")
closeAllConnections()
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
voltage<-as.numeric(data$Voltage)
GRV<-as.numeric(data$Global_reactive_power)
png("plot4.png")
par(mfrow = c(2, 2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(datetime, GRV, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()






