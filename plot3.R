require(sqldf)
data <- read.csv.sql( file='household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)
data1 <- cbind((strptime(paste(data[,1],data[,2]), format = "%d/%m/%Y %H:%M:%S")),data)
names(data1)[1] <- "datetime"
png('plot3.png')
plot(data1$datetime,data1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data1$datetime,data1$Sub_metering_1, type = "l", col = "black")
lines(data1$datetime,data1$Sub_metering_2, type = "l", col = "red")
lines(data1$datetime,data1$Sub_metering_3, type = "l", col = "blue")
label <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", label, lwd = 2, col = c("black","red","blue"))
dev.off()