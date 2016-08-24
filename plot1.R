###############################################################

#### Week 1 assignment - Plot 1

###############################################################


elec <- read.table("household_power_consumption.txt", head = T, sep = ";")

elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")

elec <- subset(elec, Date == "2007-02-01" | Date == "2007-02-02")

elec$Global_active_power <- as.character(elec$Global_active_power)
elec$Global_active_power <- as.numeric(elec$Global_active_power)

png(file = "plot1.png")

hist(elec$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

