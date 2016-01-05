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

png("plot1.png",width = 480, height = 480, bg="transparent")
#the plot, this will be different from one another
hist(power$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()