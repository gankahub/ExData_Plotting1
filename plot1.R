# add code to import files

#setting working directory
setwd("/home/ganka/Documents/IT/R/Exploratory Data Analysis/Assignment 1/ExData_Plotting1/")

Import_Consumption$Global_active_power <- as.numeric(as.character(Import_Consumption$Global_active_power))

png(height = 480, width = 480) #possibly use file= to output file

#generating the first plot using the "base" plotting system
hist(Import_Consumption$Global_active_power, main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)",ylab = "Frequency")

