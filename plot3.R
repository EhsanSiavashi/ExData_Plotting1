library(dplyr)

#Since the data set is huge, we just read a subset of it which we know includes the dates we are interested in (rows 60000 to 70000).
#The columns are seperated by ";".
#We also separate the columns and assign to them their names.
power<-read.table("household_power_consumption.txt", skip=60000, nrows = 10000, sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Now, we can use filter function from dplyr package to read only the rows we are interested in.
power<-filter(power, Date == "2/2/2007" | Date=="1/2/2007")

#convert the required columns to numerical.
power$Sub_metering_1<-as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2<-as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3<-as.numeric(as.character(power$Sub_metering_3))
power$Time<- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot the diagrams:
png("plot3.png", width = 480, height = 480)

with(power, {plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
     
        lines(Time, Sub_metering_2, type = "l", col="red")
     
        lines(Time, Sub_metering_3, type = "l" , col="blue")
     
        legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col = c("black","red","blue"))})
     
dev.off()