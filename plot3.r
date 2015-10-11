

librarY (data.table)

PowerData<-"./household_power_consumption.txt"
data <- read.table(PowerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
PowerDataClean <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(PowerDataClean$Date, PowerDataClean$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(PowerDataClean$Global_active_power)

PowerDataClean1 <- as.numeric(PowerDataClean$Sub_metering_1)
PowerDataClean2 <- as.numeric(PowerDataClean$Sub_metering_2)
PowerDataClean3 <- as.numeric(PowerDataClean$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, PowerDataClean1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, PowerDataClean2, type="l", col="red")
lines(datetime, PowerDataClean3, type="l", col="blue")
legend("topright", c("PowerDataClean_1", "PowerDataClean_2", "PowerDataClean_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
##House keeping removing temp variables
remove('PowerDataClean','PowerData')
dev.off()
print('All done!')