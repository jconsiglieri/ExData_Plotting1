#Sampling data to define column-classes
ihpc <- read.table("household_power_consumption.txt", nrows=100, header=TRUE)
classes <- sapply(ihpc,class)

#Creating dataset hpc
hpc <- read.table("household_power_consumption.txt", skip= 66637, nrow = 2880, 
                  colClasses=classes,sep=";", 
                  col.names=colnames(read.table("household_power_consumption.txt",nrow=1, header=TRUE, sep=";")))

#Create Plot1
hist(hpc$Global_active_power,col='red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")