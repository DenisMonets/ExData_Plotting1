
first_table<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
names_table<-read.table("household_power_consumption.txt", sep = ";",header = TRUE, nrows=1)
names(first_table)<-names(names_table)
Date_time<-paste(first_table$Date,first_table$Time)
Date_time<-strptime(Date_time, "%d/%m/%Y %H:%M:%S")
first_table$Date_time<-as.POSIXct(Date_time)
first_table<-first_table[,3:10]
png("plot1.png")
with(first_table,hist(Global_active_power, main = "Global active power", col="red",xlab="Global active power (in kilowatt)"))
dev.off()