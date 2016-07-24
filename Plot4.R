plot4 <- function(){
  
  library(dplyr)
  
  setwd("H:/Vicente/Estudios/Data scientist/R/Exploratory Data Analysis/Week 1")
  
  P1_PREVIEW <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE, stringsAsFactors = FALSE, nrows=5)
  
  classes <- sapply(P1_PREVIEW, class)
  
  P1 <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE, stringsAsFactors = FALSE, colClasses = classes)
  
  P1_feb2007 <- filter(P1, Date %in% c("1/2/2007", "2/2/2007"))
  
  P1_feb2007$FechaTiempo <- strptime(paste(P1_feb2007$Date, P1_feb2007$Time), "%d/%m/%Y %H:%M:%S")
  
  png("plot4.png", width=480, height=480)
  
  par(mfcol=c(2,2))
  
  
  # (1,1)
  plot(P1_feb2007$FechaTiempo, P1_feb2007$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA, col="black")
  
  #(2,1)
  
  plot(P1_feb2007$FechaTiempo, P1_feb2007$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA, col="black")
  
  lines(P1_feb2007$FechaTiempo, P1_feb2007$Sub_metering_2, col="red")
  lines(P1_feb2007$FechaTiempo, P1_feb2007$Sub_metering_3, col="blue")
  
  legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  
  #(1,2)
  
  plot(P1_feb2007$FechaTiempo, P1_feb2007$Voltage, type="l", ylab="Voltage", xlab="datetime", col="black")
  
  #(2,2)
  plot(P1_feb2007$FechaTiempo, P1_feb2007$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", col="black")
  
  dev.off()
  
  return(P1_feb2007)
}
