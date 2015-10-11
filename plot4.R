first_table<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
names_table<-read.table("household_power_consumption.txt", sep = ";",header = TRUE, nrows=1)
names(first_table)<-names(names_table)
Date_time<-paste(first_table$Date,first_table$Time)
Date_time<-strptime(Date_time, "%d/%m/%Y %H:%M:%S")
first_table$Date_time<-as.POSIXct(Date_time)
first_table<-first_table[,3:10]
png("plot4.png")
Sys.setlocale("LC_ALL","C")

par(mfrow=c(2,2),mar=c(4,4,2,1))

with(first_table,plot(Date_time,Global_active_power,type="l",xlab="",ylab="Global active power "))

with(first_table,plot(Date_time,Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(first_table,plot(Date_time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(first_table,points(Date_time,Sub_metering_1,type="l",col="black"))
with(first_table,points(Date_time,Sub_metering_2,type="l",col="red"))
with(first_table,points(Date_time,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("Black","red","blue"),,bty = "n")

with(first_table,plot(Date_time,Global_reactive_power,type="l",xlab="datetime"))

dev.off()