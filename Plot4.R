##Define Data File
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
Destfile <- "Power_Consumption.zip"
download.file(url, Destfile)
unzip(Destfile)
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
##Create Subsets and Variables required for analysis
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
Voltage <- as.numeric(subSetData$Voltage)
Sub_Metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_Metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_Metering_3 <- as.numeric(subSetData$Sub_metering_3)
##Create PLot File and Set Dimensions
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
##Create Plots
##Plot 1
plot(datetime, globalActivePower,type="l",ylab="Global Active Power", xlab = "", cex =0.2)
##Plot 2
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
##Plot 3
plot(datetime, Sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_Metering_2, type="l", col="red")
lines(datetime, Sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
##Plot 4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
