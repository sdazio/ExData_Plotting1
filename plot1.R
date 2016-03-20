# Load data
# Check if Data Frame EPC (Electric Power COnsumption Data Frame) already exists. 
# If Data Frame EPC does not exists, loadData function is called.

if (!exists("EPC")) {
  source("loadData.R")
  EPC <- loadData()
}

# Plot 1
png("Plot1.png",width= 480, height = 480,  units= "px")
hist(EPC$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()