# Load data
# Check if Data Frame EPC (Electric Power COnsumption Data Frame) already exists. 
# If Data Frame EPC does not exists, loadData function is called.

if (!exists("EPC")) {
  source("loadData.R")
  EPC <- loadData()
}

# Plot 3
png("Plot3.png",width= 480, height = 480,  units= "px")
plot(x = EPC$Time, y = EPC$Sub_metering_1, col ="black", type = "l", xlab="",ylab="Energy sub metering")
lines(x = EPC$Time, y = EPC$Sub_metering_2, col ="red")
lines(x = EPC$Time, y = EPC$Sub_metering_3, col ="blue")
legend("topright", lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
