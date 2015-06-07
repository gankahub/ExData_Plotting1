#Importing data for plotting

#converting global_active_power to numeric
Import_Consumption$Global_active_power <- as.numeric(as.character(Import_Consumption$Global_active_power))

#joining date and time
Import_Consumption$DateTime <- paste(Import_Consumption$Date,Import_Consumption$Time)
#converting date and time to DateTime POSIXct
Import_Consumption$DateTime <- as.POSIXct(strptime(Import_Consumption$DateTime, "%d/%m/%Y %H:%M:%S"))

#adding weekdate
Import_Consumption$day <- weekdays(Import_Consumption$Date)

plot(Import_Consumption$DateTime,Import_Consumption$Global_active_power,type = "l",xlab = "",ylab="Global Active Power (kilowatts)")
