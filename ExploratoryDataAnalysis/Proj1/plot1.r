data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$test<-paste(data$Date, data$Time , sep=" ")
data$Adate<-strptime(data$test, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
df<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]



df$Global_active_power<-as.numeric(df$Global_active_power)
df$Global_active_power_kilo<-df$Global_active_power/1000
hist(df$Global_active_power_kilo, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")