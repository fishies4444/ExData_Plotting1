require(sqldf)
data <- read.csv.sql( file='household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)
data1 <- cbind((strptime(paste(data[,1],data[,2]), format = "%d/%m/%Y %H:%M:%S")),data)
names(data1)[1] <- "datetime"
png('plot4.png')
par(mfrow = c(2,2))
plot(data1$datetime,data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data1$datetime,data1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data1$datetime,data1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data1$datetime,data1$Sub_metering_1, type = "l", col = "black")
lines(data1$datetime,data1$Sub_metering_2, type = "l", col = "red")
lines(data1$datetime,data1$Sub_metering_3, type = "l", col = "blue")
label <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", label, lwd = 1, col = c("black","red","blue"), bty = "n")
plot(data1$datetime,data1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()