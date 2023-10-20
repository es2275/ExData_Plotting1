## Setting Up

setwd("~/Desktop")
rawdata <- read.csv("household_power_consumption.txt", header=T)

## Plot 3

library(ggplot2)

plot3data <- rawdata %>%
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
  mutate(Datetime = as.POSIXct(paste(as.Date(Date, format = "%d/%m/%Y"), Time)))

# Create the plot using ggplot2
plot3 <- ggplot(plot3data, aes(x = Datetime)) +
  geom_line(aes(y = Sub_metering_1), color = "black") +
  geom_line(aes(y = Sub_metering_2), color = "red") +
  geom_line(aes(y = Sub_metering_3), color = "blue") +
  labs(y = "Global Active Power (kilowatts)", x = "") +
  scale_color_manual(values = c("black", "red", "blue")) +
  theme(legend.position = "topright") +
  guides(color = guide_legend(title = "Sub_metering"))

plot3

png("plot3.png", width=480, height=480)
devoff()
