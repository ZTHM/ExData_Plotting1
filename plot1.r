

librarY (data.table)

url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url,destfile = "household_power_consumption.zip")
PowerData<-unzip("household_power_consumption.zip")
data <- read.table(PowerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##House keeping removing temp variables
remove('PowerDataClean','PowerData')
dev.off()
print('All done!')