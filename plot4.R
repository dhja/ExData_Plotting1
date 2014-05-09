power<- read.csv("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
power2 <- subset(power,power$Date=="1/2/2007")
power3 <- subset(power,power$Date=="2/2/2007")
power4 <-merge(power2,power3,all.x=TRUE,all.y=TRUE)
power4$Global_active_power=as.numeric(power4$Global_active_power)
power4$Global_reactive_power=as.numeric(power4$Global_reactive_power)
power4$Voltage=as.numeric(power4$Voltage)
power4$datetime = paste(power4$Date,power4$Time)
power4$datetime = strptime(power4$datetime,format="%d/%m/%Y %H:%M:%S")
power4$Sub_metering_1 <- as.numeric(power4$Sub_metering_1)
power4$Sub_metering_2 <- as.numeric(power4$Sub_metering_2)
power4$Sub_metering_3 <- as.numeric(power4$Sub_metering_3)

par(mfrow=c(2,2))
plot(power4$datetime,power4$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(power4$datetime,power4$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(power4$datetime,power4$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(power4$datetime,power4$Sub_metering_2,type="l",col="red")
points(power4$datetime,power4$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

plot(power4$datetime,power4$Global_active_power,type="l",ylab="Global_reactive_power",xlab="datetime")


