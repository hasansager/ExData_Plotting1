plot1 <- function() {
	#read entire table
	df <- read.table("household_power_consumption.txt", header = T, sep=";", na.string="?")
	#subset the data
	val <- subset(df, df$Date=="1/2/2007" |  df$Date=="2/2/2007")
	
	hist(val$Global_active_power, main="Global Active Power", xlab= "Global Active Power (kilowatts)", col="red")
	
	dev.copy(png, file = "plot1.png")
	dev.off()
}