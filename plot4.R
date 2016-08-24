###############################################################

#### Week 1 assignment - Plot 5

###############################################################


elec <- read.table("household_power_consumption.txt", head = T, sep = ";")

elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")

elec <- subset(elec, Date == "2007-02-01" | Date == "2007-02-02")

elec$temp <- as.POSIXct(paste(elec$Date, elec$Time), format = "%Y-%m-%d %H:%M:%S")

elec$Global_active_power <- as.character(elec$Global_active_power)
elec$Global_active_power <- as.numeric(elec$Global_active_power)

elec$Sub_metering_1 <- as.character(elec$Sub_metering_1)
elec$Sub_metering_1 <- as.numeric(elec$Sub_metering_1)
elec$Sub_metering_2 <- as.character(elec$Sub_metering_2)
elec$Sub_metering_2 <- as.numeric(elec$Sub_metering_2)
elec$Sub_metering_3 <- as.character(elec$Sub_metering_3)
elec$Sub_metering_3 <- as.numeric(elec$Sub_metering_3)

elec$Voltage <- as.character(elec$Voltage)
elec$Voltage <- as.numeric(elec$Voltage)

elec$Global_reactive_power <- as.character(elec$Global_reactive_power)
elec$Global_reactive_power <- as.numeric(elec$Global_reactive_power)

png(file = "plot4.png")

par(mfrow = c(2,2))

with(elec, plot(temp, Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power (kilowatts)"))

with(elec, plot(temp, Voltage, type = "l", xlab = "datetime", 
                ylab = "Voltage"))

with(elec, plot(temp, as.numeric(Sub_metering_1), type = "l", xlab = "", 
                ylab = "Energy sub metering"))
lines(elec$temp, as.numeric(elec$Sub_metering_2), col = "red")
lines(elec$temp, as.numeric(elec$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

with(elec, plot(temp, Global_reactive_power, type = "l", xlab = "datetime", 
                ylab = "Global_reactive_power"))

dev.off()
