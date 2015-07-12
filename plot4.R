##########################################################################################
## SELECT RELEVANT DATA
##########################################################################################
dir = getwd()
require(data.table)
setwd("c://users/sanjaysr/documents/github/datacleansing")
myfile = "./household_power_consumption.txt"
dt = read.table(myfile, header = T, na.strings = "?", sep = ";", stringsAsFactors = F)
dt1 = dt[dt$Date %in% c('1/2/2007','2/2/2007'),]
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

##########################################################################################
## DRAW THE FIRST PLOT
##########################################################################################
plot ( x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Global_active_power),
       main = "",
       xlab = "",
       ylab = "Global Active Power",
       type = "l")


##########################################################################################
## DRAW THE SECOND PLOT
##########################################################################################
plot ( x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Voltage),
       main = "",
       xlab = "datetime",
       ylab = "Voltage",
       type = "l")


##########################################################################################
## DRAW THE THIRD PLOT
##########################################################################################
# First Line: Sub Metering 1
plot(  x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Sub_metering_1),
       main = "",
       xlab = "",
       ylab = "Energy Sub Metering",
       type = "l")

# Second Line: Sub Metering 2
lines( x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Sub_metering_2),
       col = "red",
       type = "l")

# Third Line: Sub Metering 3
lines( x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Sub_metering_3),
       col = "blue",
       type = "l")

# Add legend
legend("topright", 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
       col = c("black", "red", "blue"),
       lty = 1) 

##########################################################################################
## DRAW THE FOURTH PLOT
##########################################################################################
plot(  x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Global_reactive_power),
       main = "",
       xlab = "datetime",
       ylab = "Global Reactive Power",
       type = "l")


##########################################################################################
## RESTORE THE ENVIRONMENT
##########################################################################################
dev.off()
setwd(dir)

