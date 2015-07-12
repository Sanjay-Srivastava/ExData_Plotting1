##########################################################################################
## SELECT RELEVANT DATA
##########################################################################################
dir = getwd()
require(data.table)
setwd("c://users/sanjaysr/documents/github/datacleansing")
myfile = "./household_power_consumption.txt"
dt = read.table(myfile, header = T, na.strings = "?", sep = ";", stringsAsFactors = F)
dt1 = dt[dt$Date %in% c('1/2/2007','2/2/2007'),]
png("plot3.png", width = 480, height = 480)

##########################################################################################
## SELECT RELEVANT DATA
##########################################################################################
# First Line: Sub Metering 1
plot(  x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Sub_metering_1),
       main = "",
       xlab = "",
       ylab = "",
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
## RESTORE THE ENVIRONMENT
##########################################################################################
dev.off()
setwd(dir)

