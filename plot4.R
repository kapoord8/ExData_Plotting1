hpc <- read.table(file = "household_power_consumption.txt", skip = 1, sep = ";")
names(hpc) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", 
                "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc_data <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

hpc_data$Time <- strptime(hpc_data$Time, format = "%H:%M:%S")

hpc_data[1:1440, "Time"] <- format(hpc_data[1:1440, "Time"], "2007-02-01 %H:%M:%S")
hpc_data[1441:2880, "Time"] <- format(hpc_data[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

par(mfrow =c(2,2))

plot(hpc_data$Time, as.numeric(as.character(hpc_data$Global_Active_Power)), xlab="", 
     ylab = "Global Active Power (kilowatts)", type = "l")

plot(hpc_data$Time, as.numeric(as.character(hpc_data$Voltage)), xlab="datetime", 
     ylab = "Voltage", type = "l")

plot(hpc_data$Time, hpc_data$Sub_metering_1, xlab="", ylab= "Energy Sub Metering", type="n", 
     main="Energy sub-metering")
lines(hpc_data$Time,as.numeric(as.character(hpc_data$Sub_metering_1)))
lines(hpc_data$Time,as.numeric(as.character(hpc_data$Sub_metering_2)), col="red")
lines(hpc_data$Time,as.numeric(as.character(hpc_data$Sub_metering_3)), col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)

plot(hpc_data$Time, as.numeric(as.character(hpc_data$Global_Reactive_Power)), xlab="datetime", 
     ylab = "Global_reactive_power (kilowatts)", type = "l")
