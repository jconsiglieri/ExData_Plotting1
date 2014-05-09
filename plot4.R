#Sampling data to define column-classes
ihpc <- read.table("household_power_consumption.txt", nrows=100, header=TRUE)
classes <- sapply(ihpc,class)

#Creating dataset hpc
hpc <- read.table("household_power_consumption.txt", skip= 66637, nrow = 2880, 
                  colClasses=classes,sep=";", 
                  col.names=colnames(read.table("household_power_consumption.txt",nrow=1, header=TRUE, sep=";")))

#Convert Data and Time variables
wdays <- strptime(paste(hpc$Date,hpc$Time), format='%d/%m/%Y %H:%M:%S')
Sys.setlocale("LC_TIME","English")

#Create plot4
#Creating frame
par(mfrow = c(2, 2),mar=c(4,4,3,3), oma=c(1,1,1,1))
#plot4.1
plot(wdays,hpc$Global_active_power, cex.axis=0.7, cex.lab=0.7, type="l", xlab="", ylab="Global Active Power (kW)")
#plot4.2
plot(wdays,hpc$Voltage, cex.axis=0.7, cex.lab=0.7, type="l", xlab="datetime", ylab="Voltage")
#plot4.3
plot(c(min(wdays),max(wdays)), c(0,40), type="n", xlab="", ylab="Energy sub_metering", cex.lab=0.7, cex.axis=0.7)
     lines(wdays,hpc$Sub_metering_1, col="black",lwd=1.5)
     lines(wdays,hpc$Sub_metering_2, col="red",lwd=1.5)
     lines(wdays,hpc$Sub_metering_3, col="blue",lwd=1.5)
legend("topright", bty="n", cex=0.7, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red","blue"))
#plot4.4
plot(wdays,hpc$Global_reactive_power, cex.axis=0.7, cex.lab=0.7, type="l", xlab="datetime", ylab="Global Reactive Power")

