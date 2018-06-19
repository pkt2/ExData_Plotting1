library(data.table)
data <- read.table(file.choose(), skip = 1, sep = ";")
names(data) <-  c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, subset=(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"))

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$datetime <- as.POSIXct(datetime)

png(file = "plot3.png", height = 480, width = 480)
plot(data1$datetime, data1$Sub_metering_1, type= "n", xlab = "", ylab = "Energy sub metering")
with(data1, lines(datetime, as.numeric(as.character(Sub_metering_1))))
with(data1, lines(datetime, as.numeric(as.character(Sub_metering_2)), col="red"))
with(data1, lines(datetime, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1)
dev.off()