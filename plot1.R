##script for making plot 1

#download and unzip data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata-data-household_power_consumption.zip", method="curl")
unzip("exdata-data-household_power_consumption.zip")

#read data from file in the working directory
c = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert the Date variable to Date class
c <- transform(c, Date = as.Date(Date,format="%d/%m/%Y"))

#filter the data
c <- c[c$Date==as.Date("2007-02-01") | c$Date==as.Date("2007-02-02"),]

#making a plot
png(file="plot1.png")
par(ps=12)
hist(d$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()