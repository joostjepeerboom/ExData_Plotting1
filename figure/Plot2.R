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


## Create plot 2 - Line Graphs which shows how the Global Active Power Changes during the two days
## Title:
## X-Axis label: 
## Y-Axis label: Global Active Power (kilowatts)


## Plot 2
plot(HH_Consump$Global_active_power~HH_Consump$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


## Saving the Historgramm as a png file of the sixe 480 x 480 pixels
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()