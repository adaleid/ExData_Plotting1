alldata<-read.table("file:///C:/Users/ADHAM/Documents/datasciencecoursera/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";" , header = T)
as.Date(alldata$Date) ##convert to date
library(lubridate)
newd<-dmy(alldata$Date)## change to year/day/month
thedate<-which(year(newd)==2007 & month(newd)==2 & (day(newd)==1 | day(newd)==2)) ##subset only the desired date
d<-alldata[thedate,]



library(dplyr)
d1<-mutate(d, weekday = wday(Date, label = TRUE))
## All variables converted to numeric
t<-as.character(d$Global_active_power)
p<-as.numeric(t)
ga<-as.character(d1$Global_active_power)
ga1<-as.numeric(ga)
b<-dmy(d1$Date)
x<-numeric()
for(i in 1:2880){x[i]<- paste(b[i], d1$Time[i])}

<-as_datetime(x)
s1b<-as.character(d1$Sub_metering_1)
s1<-as.numeric(s1b)
s2b<-as.character(d1$Sub_metering_2)
s2<-as.numeric(s2b)

v1<-as.character(d1$Voltage)
v<-as.numeric(v1)

gr1<-as.character(d1$Global_reactive_power)
gr<-as.numeric(gr1)

##open png device
png(filename = "plot4.png") ##open png graphic device


par(mfrow=c(2,2),mar=c(4,4,1,1), oma=c(1,1,1,1)) 

##plot 4
##1st
with(d1, plot(dt, ga1, type = "l", ylab = "Global Active power(kilowatts)"))

##2nd
with(d1, plot(dt, v, type = "l", xlab = "datetime", ylab="voltage"))

##3rd
with(d1, plot(dt, s1, type = "l", ylab = "Enenrgy Sub-metering"))
with(d1, lines(dt, s2, col="red"))
with(d1, lines(dt, d1$Sub_metering_3, col="blue"))
legend ("topright", col = c("black","red", "blue"), legend = c("sub-metering 1", "sub-metering 2", "sub-metering 3"), cex= 0.8, lty = 1, text.font = 4, xjust = 1)

##4th
with(d1, plot(dt, gr, type = "l", xlab = "datetime", ylab="Globar_Reactive_Power"))

##close the device
dev.off()
