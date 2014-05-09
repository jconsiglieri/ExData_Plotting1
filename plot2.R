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

#Create plot2
plot(wdays,hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
