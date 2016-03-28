plot2 <- function() {
	#read entire table
	df <- read.table("household_power_consumption.txt", header = T, sep=";", na.string="?")
	#subset the data
	val <- subset(df, df$Date=="1/2/2007" |  df$Date=="2/2/2007")
	
	#create datetime column  for graph
	val$datetime <- strptime(paste(val$Date, val$Time), "%d/%m/%Y %H:%M:%S")
	
	plot(val$datetime,val$Global_active_power, ylab= "Global Active Power (kilowatts)", xlab="",type="l")
	
	dev.copy(png, file = "plot2.png")
	dev.off()
}