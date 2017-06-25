##Define Data File
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
Destfile <- "Power_Consumption.zip"
download.file(url, Destfile)
unzip(Destfile)
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
##Create Subsets and Variables required for analysis
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sub_Metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_Metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_Metering_3 <- as.numeric(subSetData$Sub_metering_3)
##Create Plot File and Plot
png("plot3.png", width=480, height=480)
plot(datetime, Sub_Metering_1,type="l",ylab="Energy Submetering", xlab = "")
lines(datetime, Sub_Metering_2, type="l", col="red")
lines(datetime, Sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
