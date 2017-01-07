## Open .png graphics device
png(file = "plot1.png"
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

##Creating a histogram

hist(
	filtered$Global_active_power
	,col = "red"
	,xlab = "Global Active Power (kilowatts)"
	,ylab = "Frequency"
	,main = "Global Active Power"
	)

## Close .png graphics device
dev.off()