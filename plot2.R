###############################################################

#### Week 1 assignment - Plot 2

###############################################################


elec <- read.table("household_power_consumption.txt", head = T, sep = ";")

elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")

elec <- subset(elec, Date == "2007-02-01" | Date == "2007-02-02")

elec$temp <- as.POSIXct(paste(elec$Date, elec$Time), format = "%Y-%m-%d %H:%M:%S")

elec$Global_active_power <- as.character(elec$Global_active_power)
elec$Global_active_power <- as.numeric(elec$Global_active_power)

png(file = "plot2.png")

with(elec, plot(temp, Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power (kilowatts)"))

dev.off()


