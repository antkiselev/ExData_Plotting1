##script for making plot 2

#read data from file in the working directory
c = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert the Date variable to Date class
c <- transform(c, Date = as.Date(Date,format="%d/%m/%Y"))

#filter the data
c <- c[c$Date==as.Date("2007-02-01") | c$Date==as.Date("2007-02-02"),]

#making a plot
png(file="plot2.png")
plot(c$Global_active_power, type="l", ylab="Global Active Power(kilowatts)",xlab="", xaxt = "n")
axis(side = 1, at = c(0,1400,2800), labels = c("Thu","Fri","Sat"))
dev.off()