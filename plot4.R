plot4 <- function() {
	#read entire table
	df <- read.table("household_power_consumption.txt", header = T, sep=";", na.string="?")
	#subset the data
	val <- subset(df, df$Date=="1/2/2007" |  df$Date=="2/2/2007")
	
	#create datetime column  for graph
	val$datetime <- strptime(paste(val$Date, val$Time), "%d/%m/%Y %H:%M:%S")
	
	par(mfrow= c(2,2))
	plot(val$datetime,val$Global_active_power, ylab= "Global Active Power (kilowatts)", xlab="",type="l")
	plot(val$datetime,val$Voltage, ylab= "Voltage", xlab="datetime",type="l")
	plot(val$datetime,val$Sub_metering_1, ylab= "Energy sub metering", xlab="",type="n")
	lines(val$datetime,val$Sub_metering_1)
	lines(val$datetime,val$Sub_metering_2,col="red")
	lines(val$datetime,val$Sub_metering_3,col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))
	plot(val$datetime,val$Global_reactive_power, ylab= "Global_reactive_power", xlab="datetime",type="l")
	dev.copy(png, file = "plot4.png")
	dev.off()
}