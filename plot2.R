require(sqldf)
data <- read.csv.sql( file='household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)
# data graphs
library(lubridate)
png('plot2.png')
data1 <- cbind((strptime(paste(data[,1],data[,2]), format = "%d/%m/%Y %H:%M:%S")),data)
names(data1)[1] <- "datetime"
plot(data1$datetime,data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
