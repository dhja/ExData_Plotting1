plot<-function(x){
  power<- read.csv("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  power2 <- subset(power,power$Date=="1/2/2007")
  power3 <- subset(power,power$Date=="2/2/2007")
  power4 <-merge(power2,power3,all.x=TRUE,all.y=TRUE)
  power4$Global_active_power=as.numeric(power4$Global_active_power)
  hist(power4$Global_active_power,xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red")


}