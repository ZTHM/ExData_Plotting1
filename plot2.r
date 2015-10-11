

librarY (data.table)

PowerData<-"./household_power_consumption.txt"
data <- read.table(PowerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
PowerDataClean <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(PowerDataClean$Date, PowerDataClean$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(PowerDataClean$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


##House keeping removing temp variables
remove('PowerDataClean','PowerData')
dev.off()
print('All done!')
