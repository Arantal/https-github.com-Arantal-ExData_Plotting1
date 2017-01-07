## Open .png graphics device
png(file = "plot4.png"
	,width = 480
	,height = 480
	)
	
## Reading all the data in
data <- read.table(
	file = "household_power_consumption.txt"
	,header = TRUE
	,sep = ";"
	,na.strings = "?")
##	,nrow = 1000)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Filtering by date

filtered <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## DateTime conversion

filtered$DateTime <- as.POSIXct(paste(as.Date(filtered$Date), filtered$Time))

## creating the plot
 par(mfcol = c(2,2))

 plot(filtered$Global_active_power ~ filtered$DateTime
		,type = "l"
		,xlab = ""
		,ylab = "Global Active Power (kilowatts)"
		)
	
{
plot(filtered$Sub_metering_1 ~ filtered$DateTime
			,type = "l"
			,ylab = "Energy sub metering"
			,xlab = "")
		lines(filtered$Sub_metering_2 ~ filtered$DateTime
			,col = "red")
		lines(filtered$Sub_metering_3 ~ filtered$DateTime
			,col = "blue")
	}
	legend("topright"
		,lwd = 1
		,bty = "n"
		,col = c("black","red","blue")
		,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
		)


plot(filtered$Voltage ~ filtered$DateTime
		,type = "l"
		,xlab = "datetime"
		,ylab = "Voltage"
		)

plot(filtered$Global_reactive_power ~ filtered$DateTime
	,type = "l"
	,xlab = "datetime"
	,ylab = "Global_reactive_power"
	)
	
dev.off()