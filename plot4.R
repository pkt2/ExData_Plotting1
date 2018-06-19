library(data.table)
data <- read.table(file.choose(), skip = 1, sep = ";")
names(data) <-  c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, subset=(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"))

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$datetime <- as.POSIXct(datetime)

png(file = "plot4.png")
par(mfrow = c(2,2))
with(data1, {
    plot(data1$datetime, as.numeric(as.character(data1$Global_active_power)),xlab = "", ylab = "Global Active Power" , type = "l")
    plot(data1$datetime, as.numeric(as.character(data1$Voltage)),xlab = "datetime", ylab = "Voltage" , type ="l")
    plot(data1$datetime, data1$Sub_metering_1, type= "n", xlab = "", ylab = "Energy sub metering")
    with(data1, lines(datetime, as.numeric(as.character(Sub_metering_1))))
    with(data1, lines(datetime, as.numeric(as.character(Sub_metering_2)), col="red"))
    with(data1, lines(datetime, as.numeric(as.character(Sub_metering_3)), col="blue"))
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, cex = 0.6)
    plot(data1$datetime, as.numeric(as.character(data1$Global_reactive_power)),xlab = "datetime", ylab = "Global_reactive_power", type = "l" )
 })
dev.off()

