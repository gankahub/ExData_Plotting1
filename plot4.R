##creating data file
if(!file.exists("data")){
  dir.create("data")
}

##downloading file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./data/exdata%2Fdata%2Fhousehold_power_consumption.zip",method="curl")

##unzipping file
unzip("./data/exdata%2Fdata%2Fhousehold_power_consumption.zip",exdir="./data")

##Reading in whole file
Import_Raw <- read.table(file = "./data/household_power_consumption.txt",header = TRUE,sep=";")

##Selecting in only necessary rows
Import_Consumption <- subset(x = Import_Raw,Date == "1/2/2007" | Date == "2/2/2007")
Import_Consumption$Global_active_power <- as.numeric(as.character(Import_Consumption$Global_active_power))

#Setting up data
#joining date and time
Import_Consumption$DateTime <- paste(Import_Consumption$Date,Import_Consumption$Time)
#converting date and time to DateTime POSIXct
Import_Consumption$DateTime <- as.POSIXct(strptime(Import_Consumption$DateTime, "%d/%m/%Y %H:%M:%S"))
#converting global_active_power to numeric
Import_Consumption$Global_active_power <- as.numeric(as.character(Import_Consumption$Global_active_power))

#converting voltage to numeric
Import_Consumption$Voltage <- as.numeric(as.character(Import_Consumption$Voltage))

#converting global reactive power to numeric
Import_Consumption$Global_reactive_power <- as.numeric(as.character(Import_Consumption$Global_reactive_power))

#converting energy sub metering to numeric
Import_Consumption$Sub_metering_1 <- as.numeric(as.character(Import_Consumption$Sub_metering_1))
Import_Consumption$Sub_metering_2 <- as.numeric(as.character(Import_Consumption$Sub_metering_2))
Import_Consumption$Sub_metering_3 <- as.numeric(as.character(Import_Consumption$Sub_metering_3))

#arranging plots in grid
par(mfrow = c(2,2))

#Creating first plot
plot(Import_Consumption$DateTime,Import_Consumption$Global_active_power,type = "l",xlab = "",ylab="Global Active Power")

#Creating second plot
plot(Import_Consumption$DateTime,Import_Consumption$Voltage,type="l",main="",xlab = "datetime",ylab="Voltage")

#Creating third plot
with(Import_Consumption,plot(DateTime,Sub_metering_1,main="",type="n",xlab="",ylab="Energy sub meeting"))
lines(Import_Consumption$DateTime,Import_Consumption$Sub_metering_1,col="black")
lines(Import_Consumption$DateTime,Import_Consumption$Sub_metering_2,col="red")
lines(Import_Consumption$DateTime,Import_Consumption$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty = 1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.8)

#Creating forth plot
plot(Import_Consumption$DateTime,Import_Consumption$Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power")

#exporting to png
png(filename="./plot4.png")
