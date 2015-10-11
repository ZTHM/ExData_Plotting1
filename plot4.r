

librarY (data.table)

PowerData<-"./household_power_consumption.txt"
data <- read.table(PowerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
PowerDataClean <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(PowerDataClean$Date, PowerDataClean$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 


Sub_metering_1 <- as.numeric(PowerDataClean$Sub_metering_1)
Sub_metering_2 <- as.numeric(PowerDataClean$Sub_metering_2)
Sub_metering_3 <- as.numeric(PowerDataClean$Sub_metering_3)
voltage <-as.numeric(PowerDataClean$Voltage)
global_Active_Power <- as.numeric(PowerDataClean$Global_active_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_Active_Power , type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_Active_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

##House keeping removing temp variables
remove('PowerDataClean','PowerData')
dev.off()
print('All done!')