
#setwd("C:\\Users\\tomas\\Desktop\\R files\\explaratory data analyses")

#
#list.files()#-- shows all files is working directory

# library(sqldf)-- enables subsetting with select command while reading data
# line to read subsetted data
data<-read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE,sep=";")
closeAllConnections()
png(filename="plot1.png")
hist(data$Global_active_power,col = "red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

