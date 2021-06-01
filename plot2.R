hpc <- read.table(file = "household_power_consumption.txt", skip = 1, sep = ";")
names(hpc) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", 
                "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc_data <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

hpc_data$Time <- strptime(hpc_data$Time, format = "%H:%M:%S")

hpc_data[1:1440, "Time"] <- format(hpc_data[1:1440, "Time"], "2007-02-01 %H:%M:%S")
hpc_data[1441:2880, "Time"] <- format(hpc_data[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

plot(hpc_data$Time, as.numeric(as.character(hpc_data$Global_Active_Power)), xlab="", 
     ylab = "Global Active Power (kilowatts)", type = "l")