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



#################################
## Plot 2 #######################
#################################

plot(hpcss$DateTime, hpcss$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

## This part creates plot as .png file:
png(file = "Plot2.png")
plot(hpcss$DateTime, hpcss$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()