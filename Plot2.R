## Setting Up

setwd("~/Desktop")
rawdata <- read.csv("household_power_consumption.txt", header=T)

## Plot2

plot2data <- rawdata %>%
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
  mutate(Datetime = as.POSIXct(paste(as.Date(Date, format = "%d/%m/%Y"), Time)))

ggplot(plot2data, aes(x = Datetime, y = Global_active_power)) +
  geom_line() +
  labs(y = "Global Active Power (kilowatts)", x = "")

png("plot2.png", width=480, height=480)
dev.off()
