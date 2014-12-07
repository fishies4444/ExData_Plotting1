# loading the data
require(sqldf)
data <- read.csv.sql( file='household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)
# data graphs
# global active power
png('plot1.png')
par(mfrow = c(1,1), mar = c(5,4,3,3))
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()