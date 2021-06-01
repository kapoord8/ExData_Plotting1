hpc <- read.table(file = "household_power_consumption.txt", skip = 1, sep = ";")
names(hpc) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", 
                "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc_data <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

hist(as.numeric(as.character(hpc_data$Global_Active_Power)), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

