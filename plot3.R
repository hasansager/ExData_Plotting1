plot3 <- function() {
	#read entire table
	df <- read.table("household_power_consumption.txt", header = T, sep=";", na.string="?")
	#subset the data
	val <- subset(df, df$Date=="1/2/2007" |  df$Date=="2/2/2007")
	
	#create datetime column  for graph
	val$datetime <- strptime(paste(val$Date, val$Time), "%d/%m/%Y %H:%M:%S")
	
	plot(val$datetime,val$Sub_metering_1, ylab= "Energy sub metering", xlab="",type="n")
	
	lines(val$datetime,val$Sub_metering_1)
	lines(val$datetime,val$Sub_metering_2,col="red")
	lines(val$datetime,val$Sub_metering_3,col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))
	
	dev.copy(png, file = "plot3.png")
	dev.off()
}