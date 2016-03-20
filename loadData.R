## Load dataset into R
loadData <- function() {
  # Zip file URL and Name and Data File Name
  zipFileURL  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipFileName <- "household_power_consumption.zip"
  fileName    <- "household_power_consumption.txt"
  
  ## Download and unzip the dataset:
  if (!file.exists(zipFileName)){
    download.file(zipFileURL, zipFileName, method="curl")
  }  
  
  ## Unzip data file
  if (!file.exists("household_power_consumption.txt")) { 
    unzip(zipFileName) 
  }
  
  # Load data 
  df <- read.table(fileName,
                   header=TRUE,
                   sep=";",
                   colClasses=c("character", "character", rep("numeric",7)),
                   na="?")
  
  # Convert date and time variables to Date/Time class
  df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  df$Date <- as.Date(df$Date, "%d/%m/%Y")
  
  # Filter data set: data from the dates 2007-02-01 and 2007-02-02
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  df <- subset(df, Date %in% dates)
  
  return(df)
  
}
