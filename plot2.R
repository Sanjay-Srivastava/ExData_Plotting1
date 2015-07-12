##########################################################################################
## SELECT RELEVANT DATA
##########################################################################################
dir = getwd()
require(data.table)
setwd("c://users/sanjaysr/documents/github/datacleansing")
myfile = "./household_power_consumption.txt"
dt = read.table(myfile, header = T, na.strings = "?", sep = ";", stringsAsFactors = F)
dt1 = dt[dt$Date %in% c('1/2/2007','2/2/2007'),]
png("plot2.png", width = 480, height = 480)


##########################################################################################
## DRAW THE PLOT
##########################################################################################
plot ( x = strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
       y = as.numeric(dt1$Global_active_power),
       main = "",
       xlab = "",
       ylab = "Global Active Power",
       type = "l")


##########################################################################################
## RESTORE THE ENVIRONMENT
##########################################################################################
dev.off()
setwd(dir)

