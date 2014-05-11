data<-read.table("./household_power_consumption.txt",head=TRUE,sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
dataSub<-subset(data,Date =="2007-02-01" | Date == "2007-02-02")
dataSub$Time<-as.character(dataSub$Time)
dataSub$dateTime <-as.POSIXct(paste(dataSub$Date,dataSub$Time))


dataSub$Global_active_power<-as.numeric(as.character(dataSub$Global_active_power))

png(file="plot2.png",height=480,width=480)
plot(dataSub$dateTime,dataSub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",cex.lab=.75, cex.axis=.75)
dev.off()