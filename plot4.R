##script for making plot 4

#read data from file in the working directory
c = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert the Date variable to Date class
c <- transform(c, Date = as.Date(Date,format="%d/%m/%Y"))

#filter the data
c <- c[c$Date==as.Date("2007-02-01") | c$Date==as.Date("2007-02-02"),]

#making a plot
png(file="plot4.png")
par(mfcol=c(2,2), mar=c(4,4,1,1))

plot(c$Global_active_power, type="l", ylab="Global Active Power",xlab="", xaxt = "n")
axis(side = 1, at = c(0,1400,2800), labels = c("Thu","Fri","Sat"))

plot(c$Sub_metering_1, type="l",xlab="", xaxt = "n", col="black", ylab="Energy sub metering")
lines(c$Sub_metering_2, type="l", col="red")
lines(c$Sub_metering_3, type="l", col="blue")
axis(side = 1, at = c(0,1400,2800), labels = c("Thu","Fri","Sat"))
legend("topright", bty="n", cex=0.9, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1),col=c("black","red","blue"))

plot(c$Voltage, type="l", ylab="Voltage", xlab="datetime", xaxt = "n")
axis(side = 1, at = c(0,1400,2800), labels = c("Thu","Fri","Sat"))

plot(c$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt = "n")
axis(side = 1, at = c(0,1400,2800), labels = c("Thu","Fri","Sat"))
dev.off()