alldata<-read.table("file:///C:/Users/ADHAM/Documents/datasciencecoursera/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";" , header = T)
as.Date(alldata$Date) ##convert to date
library(lubridate)
newd<-dmy(alldata$Date)## change to year/day/month
thedate<-which(year(newd)==2007 & month(newd)==2 & (day(newd)==1 | day(newd)==2)) ##subset only the desired date
d<-alldata[thedate,]



library(dplyr)
d1<-mutate(d, weekday = wday(Date, label = TRUE))
ga<-as.character(d1$Global_active_power)
ga1<-as.numeric(ga)
b<-dmy(d1$Date)
x<-numeric()
for(i in 1:2880){x[i]<- paste(b[i], d1$Time[i])}

dt<-as_datetime(x)
png(filename = "plot2.png") ##open png graphic device
with(d1, plot(dt, ga1, type = "l", ylab = "Global Active power(kilowatts)")) ##plot the curve
dev.off()
