  power<- read.csv("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  power2 <- subset(power,power$Date=="1/2/2007")
  power3 <- subset(power,power$Date=="2/2/2007")
  power4 <-merge(power2,power3,all.x=TRUE,all.y=TRUE)
  power4$Global_active_power=as.numeric(power4$Global_active_power)
  power4$datetime = paste(power4$Date,power4$Time)
  power4$datetime = strptime(power4$datetime,format="%d/%m/%Y %H:%M:%S")
  plot(power4$datetime,power4$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
