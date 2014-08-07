## Read in household data. Subset to required dates
hpc <- read.csv("household_power_consumption.txt", sep=";")
hpcss <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")


################################
## Convert data Types ##########
################################ 

## hpcss$Date from factor to Date. 
hpcss$Date <- as.Date(hpcss$Date, format="%d/%m/%Y")
## Convert hpcss$Time type to Time.
hpcss$Time <- strptime(hpcss$Time, format="%H:%M:%S") # remove dates
## Convert from factor to char, then num
hpcss$Global_active_power <- as.character(hpcss$Global_active_power)
hpcss$Global_active_power <- as.numeric(hpcss$Global_active_power)


#################################
## Plot 1 #######################
#################################

hist(hpcss$Global_active_power, col="orangered", xlab= "Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

## This part creates plot as .png file:
png(file = "Plot1.png")
hist(hpcss$Global_active_power, col="orangered", xlab= "Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()