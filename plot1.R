alldata<-read.table("file:///C:/Users/ADHAM/Documents/datasciencecoursera/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";" , header = T)
as.Date(alldata$Date) ##convert to date
library(lubridate)
newd<-dmy(alldata$Date)## change to year/day/month
thedate<-which(year(newd)==2007 & month(newd)==2 & (day(newd)==1 | day(newd)==2)) ##subset only the desired date
d<-alldata[thedate,]
t<-as.character(d$Global_active_power)
p<-as.numeric(t)
png(filename = "plot1.png") ##open png graphic device
hist(p, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red" ) ##plot histogram
dev.off()
