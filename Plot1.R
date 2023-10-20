## Setting Up

setwd("~/Desktop")
rawdata <- read.csv("household_power_consumption.txt", header=T)

## Plot 1

plot1data <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))
plot1data$Date <- as.Date(plot1data$Date, format="%d/%m/%Y")

plot1 <- hist(plot1data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width=480, height=480)
