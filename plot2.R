library(dplyr)

#Since the data set is huge, we just read a subset of it which we know includes the dates we are interested in (rows 60000 to 70000).
#The columns are seperated by ";".
#We also separate the columns and assign to them their names.
power<-read.table("household_power_consumption.txt", skip=60000, nrows = 10000, sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Now, we can use filter function from dplyr package to read only the rows we are interested in.
power<-filter(power, Date == "2/2/2007" | Date=="1/2/2007")


#convert the Gloval Active Power to numerical.
power$Global_active_power<-as.numeric(as.character(power$Global_active_power))


#Convert the Time column to Time and Date format.
power$Time<- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")


#plot the diagram:
png("plot2.png", width = 480, height = 480)
plot(power$Time, power$Global_active_power,type = "l", xlab= "", ylab = "Global Active Power (kilowatts")
dev.off()

