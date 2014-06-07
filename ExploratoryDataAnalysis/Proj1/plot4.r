data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$test<-paste(data$Date, data$Time , sep=" ")
data$Adate<-strptime(data$test, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
df<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

par(mfrow = c(2, 2), mar = c(2, 5, 2, 2))
with(df, {
    plot(Adate, Global_active_power_kilo, ylab="Global Active Power (kilowatts)", xlab="", type="l")
    plot(Adate, Voltage, ylab="Voltage", xlab="", type="l")
    plot(Adate, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(Adate, Sub_metering_2, type="l", col="red")
    lines(Adate, Sub_metering_3, type="l", col="blue")
    legend(x = "topright",  
           bty = "n",  
           y.intersp = 0.8,  
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   
           lty=c(1, 1, 1),   
           lwd=c(2.5, 2.5, 2.5),  
           col=c("black", "red", "blue"),  
           pt.cex=1,  
           cex=0.5 )
    plot(Adate, Global_reactive_power, ylab="global_rective_power", xlab="", type="l")
})
