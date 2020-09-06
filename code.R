
#Read data

epcdata <- read.delim("household_power_consumption.txt",
                      header = TRUE, sep = ";")
#Convert Date using as.Date
epcdata[,1] <- as.Date(epcdata[,1], format = "%d/%m/%Y")
#Keep only observations on 2007/02/01 or 2007/02/02
epcdata <- subset(epcdata, epcdata$Date == "2007-02-01"
                  | epcdata$Date == "2007-02-02")

#plot 1
hist(as.numeric(as.character(epcdata$Global_active_power))
     , xlab = "Global Active Power", col= "red",
     main = "Global Active Power")


#plot 2
epcdata$DateTime <- paste(epcdata$Date, epcdata$Time)
epcdata$DateTime1 <- strptime(epcdata$DateTime, format = "%Y-%m-%d %H:%M:%S")
plot(epcdata$DateTime1, as.numeric(as.character(epcdata$Global_active_power)), type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "" )

#plot 3
plot(epcdata$DateTime1, as.numeric(as.character(epcdata$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(epcdata$DateTime1, as.numeric(as.character(epcdata$Sub_metering_2)), col = "red")
lines(epcdata$DateTime1, as.numeric(as.character(epcdata$Sub_metering_3)), col = "blue")
legend(x = "topright", legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), col = c("black", "red", "blue"), lty = 1)

#plot 4
par(mfrow = c(2,2))
#Upper left
plot(epcdata$DateTime1, as.numeric(as.character(epcdata$Global_active_power)), type = "l", ylab = "Global Activty Power (Kilowatts)", xlab = "" )
#Upper Right
plot(epcdata$DateTime1, as.numeric(as.character(epcdata$Voltage)), type = "l", xlab = "datetime"
     , ylab = "Voltage")
#Lower left
plot(epcdata$DateTime1, as.numeric(as.character(epcdata$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(epcdata$DateTime1, as.numeric(as.character(epcdata$Sub_metering_2)), col = "red")
lines(epcdata$DateTime1, as.numeric(as.character(epcdata$Sub_metering_3)), col = "blue")
legend(x = "topright", legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
#Lower right
plot(epcdata$DateTime1, as.numeric(as.character(epcdata$Global_reactive_power)), type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
