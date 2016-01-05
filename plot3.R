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

png("plot3.png",width = 480, height = 480, bg="transparent")
#the plot, this will be different from one another
plot(power$DateTime, power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(power$DateTime, power$Sub_metering_2, type = "l", col="red")
points(power$DateTime, power$Sub_metering_3, type = "l", col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty = 1)
dev.off()