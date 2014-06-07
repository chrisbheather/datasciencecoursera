data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$test<-paste(data$Date, data$Time , sep=" ")
data$Adate<-strptime(data$test, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
df<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

plot(df$Adate, df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(df$Adate, df$Sub_metering_2, type="l", col="red")
lines(df$Adate, df$Sub_metering_3, type="l", col="blue")
legend(x = "topright", bty = "n", y.intersp = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"), pt.cex=1,  cex=1 )
