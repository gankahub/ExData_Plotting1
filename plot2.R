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

#converting global_active_power to numeric
Import_Consumption$Global_active_power <- as.numeric(as.character(Import_Consumption$Global_active_power))

#joining date and time
Import_Consumption$DateTime <- paste(Import_Consumption$Date,Import_Consumption$Time)
#converting date and time to DateTime POSIXct
Import_Consumption$DateTime <- as.POSIXct(strptime(Import_Consumption$DateTime, "%d/%m/%Y %H:%M:%S"))

plot(Import_Consumption$DateTime,Import_Consumption$Global_active_power,type = "l",xlab = "",ylab="Global Active Power (kilowatts)")

#exporting to png
png(filename="./plot2.png")