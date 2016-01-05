#please download the txt file and put it in a folder named "data"
#under your working directory
#install the sqldf library if needed.
#sqldf give us the power to use SQL script in R
if(!require('sqldf')){
  install.packages('sqldf')
}
#load the sqldf library
library(sqldf)
#load data
power <- read.csv.sql("data/household_power_consumption.txt",
                  sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                  header = TRUE, sep = ";")
#data type change, from string to date
power$Date=as.Date(power$Date,format="%d/%m/%Y")
#add new collum DateTime
power$DateTime=strptime(paste(power$Date,power$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png",width = 480, height = 480, bg="transparent")
#the plot, this will be different from one another
plot(power$DateTime, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()