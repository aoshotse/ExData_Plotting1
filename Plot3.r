## Read in household data. Subset to required dates
hpc <- read.csv("household_power_consumption.txt", sep=";")
hpcss <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")


################################
## Convert data Types ##########
################################ 

## hpcss$Date and  hpcss$Time to a single DateTime measurement vector
hpcss$DateTime <- strptime(paste(hpcss$Date,hpcss$Time), format="%d/%m/%Y %H:%M:%S")
## Convert from factor to char, then num
hpcss$Global_active_power <- as.character(hpcss$Global_active_power)
hpcss$Global_active_power <- as.numeric(hpcss$Global_active_power)
## Convert from factor to char, then num
hpcss$Sub_metering_1 <- as.character(hpcss$Sub_metering_1)
hpcss$Sub_metering_1 <- as.numeric(hpcss$Sub_metering_1)
## Convert from factor to char, then num
hpcss$Sub_metering_2 <- as.character(hpcss$Sub_metering_2)
hpcss$Sub_metering_2 <- as.numeric(hpcss$Sub_metering_2)


#################################
## Plot 3 #######################
#################################

plot(hpcss$DateTime, hpcss$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpcss$DateTime, hpcss$Sub_metering_2, type="l", col="red")
lines(hpcss$DateTime, hpcss$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
lty=c(1,1,1), 
lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

## This part creates plot as .png file:
png(file = "Plot3.png")
plot(hpcss$DateTime, hpcss$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpcss$DateTime, hpcss$Sub_metering_2, type="l", col="red")
lines(hpcss$DateTime, hpcss$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
lty=c(1,1,1), 
lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()