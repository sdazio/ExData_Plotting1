# # Load data
# Check if Data Frame EPC (Electric Power COnsumption Data Frame) already exists. 
# If Data Frame EPC does not exists, loadData function is called.

if (!exists("EPC")) {
  source("loadData.R")
  EPC <- loadData()
}

# Plot 4
png("Plot4.png",width= 480, height = 480,  units= "px")
par(mfrow = c(2,2))

# Graphic 1
plot(x = EPC$Time, y = EPC$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)")

# Graphic 2
plot(x = EPC$Time, y = EPC$Voltage, type = "l", xlab="datetime",ylab="Voltage")

# Graphic 3
plot(x = EPC$Time, y = EPC$Sub_metering_1, col ="black", type = "l", xlab="",ylab="Energy sub metering")
lines(x = EPC$Time, y = EPC$Sub_metering_2, col ="red")
lines(x = EPC$Time, y = EPC$Sub_metering_3, col ="blue")
legend("topright", lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Graphic 4
plot(x = EPC$Time, y = EPC$Global_reactive_power, type = "l", xlab="datetime",ylab="Global_Reactive_Power")

dev.off()