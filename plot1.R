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

#generating the first plot using the "base" plotting system
hist(Import_Consumption$Global_active_power, main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)",ylab = "Frequency")

#exporting to png
png(filename="./plot1.png") #possibly use file= to output file
