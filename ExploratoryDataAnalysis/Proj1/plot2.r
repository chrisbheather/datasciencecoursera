data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$test<-paste(data$Date, data$Time , sep=" ")
data$Adate<-strptime(data$test, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
df<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

plot(df$Adate, df$Global_active_power_kilo, ylab="Global Active Power (kilowatts)", xlab="", type="l")