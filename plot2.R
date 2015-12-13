
data<-read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE,sep=";")
closeAllConnections()



# converting variable to correct data types
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

