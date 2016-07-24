plot1 <- function(){
  
  library(dplyr)
  
  setwd("H:/Vicente/Estudios/Data scientist/R/Exploratory Data Analysis/Week 1")

  P1_PREVIEW <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE, stringsAsFactors = FALSE, nrows=5)
  
  classes <- sapply(P1_PREVIEW, class)
  
  P1 <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE, stringsAsFactors = FALSE, colClasses = classes)
  
  P1_feb2007 <- filter(P1, Date %in% c("1/2/2007", "2/2/2007"))
  
  png("plot1.png", width=480, height=480)
  
  hist(P1_feb2007$Global_active_power, xlab = "Global Active Power (kilowatts)", main="Global Active Power", c="Red")
  
  dev.off()
  
  return(P1_feb2007)
  
}