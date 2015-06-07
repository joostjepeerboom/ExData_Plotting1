## Examining how household energy usage varies over a 2-day period
## 2-day period is between 2007-02-01 and 2007-02-02


## Uploading the manually trimmed dataset into R
HH_Consump <- read.csv("household_power_consumptionTRIM.txt", sep=';', na.strings="?", header=T, nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


## See the Top and Bottom rows of the uploaded data file
head(HH_Consump)
tail(HH_Consump)

## In order to display the Global Active Power During the two days, the Date + Time Columns need to be combined
HH_Consump$Date <- as.Date(HH_Consump$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(HH_Consump$Date), HH_Consump$Time)
HH_Consump$Datetime <- as.POSIXct(DateTime)

## Create plot 3 ; Sub_Metering 1 as the plot and Sub_Metering 2 and 3 as added lines to the plot with a legend in top right corner
with(HH_Consump, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

## Saving the Historgramm as a png file of the sixe 480 x 480 pixels
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()