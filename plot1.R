library(data.table)
data <- read.table(file.choose(), skip = 1, sep = ";")
names(data) <-  c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, subset=(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"))

png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(data1$Global_active_power)), xlab = "Global Active Power (killowatts)", main = "Global Active Power", col = "red")
dev.off()

