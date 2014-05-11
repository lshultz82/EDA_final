data<-read.table("./household_power_consumption.txt",head=TRUE,sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
dataSub<-subset(data,Date =="2007-02-01" | Date == "2007-02-02")
dataSub$Time<-as.character(dataSub$Time)
dataSub$dateTime <-as.POSIXct(paste(dataSub$Date,dataSub$Time))

dataSub$Sub_metering_1<-as.numeric(as.character(dataSub$Sub_metering_1))
dataSub$Sub_metering_2<-as.numeric(as.character(dataSub$Sub_metering_2))
dataSub$Global_active_power<-as.numeric(as.character(dataSub$Global_active_power))
dataSub$Global_reactive_power <-as.numeric(as.character(dataSub$Global_reactive_power))
dataSub$Voltage <-as.numeric(as.character(dataSub$Voltage))


png(file="plot4.png",height=480,width=480)
par(mfrow=c(2,2),cex=.65)

with(dataSub,{ 
  plot(dataSub$dateTime,dataSub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",cex.lab=.75, cex.axis=.75) 
  plot(dataSub$dateTime,dataSub$Voltage,type="l",ylab="Voltage",xlab="datetime",cex.lab=.75, cex.axis=.75) 
  plot(dataSub$dateTime,dataSub$Sub_metering_1,type="l",ylab="Engery sub metering",xlab="",cex.axis=.75,cex.lab=.75)
               lines(dataSub$dateTime,dataSub$Sub_metering_2,type="l",col="red")
               lines(dataSub$dateTime,dataSub$Sub_metering_3,type="l",col="blue")
               legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.25,lty=1) 
  plot(dataSub$dateTime,dataSub$Global_reactive_power,type="l",ylab="Global Reactive Power (kilowatts)",xlab="datetime",cex.lab=.75, cex.axis=.75)
  })

dev.off()