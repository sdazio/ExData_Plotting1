# Load data
# Check if Data Frame EPC (Electric Power COnsumption Data Frame) already exists. 
# If Data Frame EPC does not exists, loadData function is called.

if (!exists("EPC")) {
  source("loadData.R")
  EPC <- loadData()
}

# Plot 2
png("Plot2.png",width= 480, height = 480,  units= "px")
plot(x = EPC$Time, y = EPC$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
