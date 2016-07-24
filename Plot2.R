plot2 <- function(){
  
  library(dplyr)
  
  setwd("H:/Vicente/Estudios/Data scientist/R/Exploratory Data Analysis/Week 1")
  
  P1_PREVIEW <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE, stringsAsFactors = FALSE, nrows=5)
  
  classes <- sapply(P1_PREVIEW, class)
  
  P1 <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE, stringsAsFactors = FALSE, colClasses = classes)
  
  P1_feb2007 <- filter(P1, Date %in% c("1/2/2007", "2/2/2007"))
  
  P1_feb2007$FechaTiempo <- strptime(paste(P1_feb2007$Date, P1_feb2007$Time), "%d/%m/%Y %H:%M:%S")
  
  png("plot2.png", width=480, height=480)
  
  plot(P1_feb2007$FechaTiempo, P1_feb2007$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA, col="black")
  
  dev.off()
  
  return(P1_feb2007)
}