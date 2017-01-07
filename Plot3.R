## Open .png graphics device
png(file = "plot3.png"
	,width = 480
	,height = 480
	)
	
## Reading all the data in
data <- read.table(
	file = "household_power_consumption.txt"
	,header = TRUE
	,sep = ";"
	,na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Filtering by date

filtered <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## DateTime conversion

filtered$DateTime <- as.POSIXct(paste(as.Date(filtered$Date), filtered$Time))

## creating the plot
with(filtered, {
		plot(filtered$Sub_metering_1 ~ filtered$DateTime
			,type = "l"
			,ylab = "Energy sub metering"
			,xlab = "")
		lines(filtered$Sub_metering_2 ~ filtered$DateTime
			,col = "red")
		lines(filtered$Sub_metering_3 ~ filtered$DateTime
			,col = "blue")
	})
legend("topright"
		,lwd = 1
		,col = c("black","red","blue")
		,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
	)

dev.off()