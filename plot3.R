#Importing Data to create graph


#joining date and time
Import_Consumption$DateTime <- paste(Import_Consumption$Date,Import_Consumption$Time)
#converting date and time to DateTime POSIXct
Import_Consumption$DateTime <- as.POSIXct(strptime(Import_Consumption$DateTime, "%d/%m/%Y %H:%M:%S"))

#converting energy sub metering to numeric
Import_Consumption$Sub_metering_1 <- as.numeric(as.character(Import_Consumption$Sub_metering_1))
Import_Consumption$Sub_metering_2 <- as.numeric(as.character(Import_Consumption$Sub_metering_2))
Import_Consumption$Sub_metering_3 <- as.numeric(as.character(Import_Consumption$Sub_metering_3))

#creating plot
with(Import_Consumption,plot(DateTime,Sub_metering_1,main="",type="n",xlab="",ylab="Energy sub meeting"))
lines(Import_Consumption$DateTime,Import_Consumption$Sub_metering_1,col="black")
lines(Import_Consumption$DateTime,Import_Consumption$Sub_metering_2,col="red")
lines(Import_Consumption$DateTime,Import_Consumption$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty = 1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
