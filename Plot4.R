## Setting Up

setwd("~/Desktop")
rawdata <- read.csv("household_power_consumption.txt", header=T)

## Plot 4

# Load necessary libraries
library(ggplot2)

## Data Cleaning

data <- rawdata %>%
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
  mutate(Datetime = as.POSIXct(paste(as.Date(Date, format = "%d/%m/%Y"), Time)))

## Plotting - Individual

p1 <- ggplot(data, aes(x = Datetime, y = Global_active_power)) +
  geom_line() +
  labs(y = "Global Active Power (kilowatts)", x = "")


p2 <- ggplot(data, aes(x = Datetime, y = Voltage)) +
  geom_line() +
  labs(y = "Voltage (volt)", x = "")

p3 <- ggplot(data, aes(x = Datetime)) +
  geom_line(aes(y = Sub_metering_1), color = "black") +
  geom_line(aes(y = Sub_metering_2), color = "red") +
  geom_line(aes(y = Sub_metering_3), color = "blue") +
  labs(y = "Global Active Power (kilowatts)", x = "") +
  scale_color_manual(values = c("black", "red", "blue"))

p4 <- ggplot(data, aes(x = Datetime, y = Global_reactive_power)) +
  geom_line() +
  labs(y = "Global Reactive Power (kilowatts)", x = "")

## Combining

library(gridExtra)
grid.arrange(p1, p2, p3, p4, ncol = 2)

## Saving
png("plot4.png", width=480, height=480)
devoff()
