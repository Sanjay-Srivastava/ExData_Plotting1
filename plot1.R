##########################################################################################
## SELECT RELEVANT DATA
##########################################################################################
dir = getwd()
require(data.table)
setwd("c://users/sanjaysr/documents/github/datacleansing")
myfile = "./household_power_consumption.txt"
dt = read.table(myfile, header = T, na.strings = "?", sep = ";", stringsAsFactors = F)
dt1 = dt[dt$Date %in% c('1/2/2007','2/2/2007'),]
png("plot1.png", width = 480, height = 480)

##########################################################################################
## DRAW THE PLOT
##########################################################################################
hist(as.numeric(dt1$Global_active_power),
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)",
     col = "red")

##########################################################################################
## RESTORE THE ENVIRONMENT
##########################################################################################
dev.off()
setwd(dir)

