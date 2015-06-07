## Examining how household energy usage varies over a 2-day period
## 2-day period is between 2007-02-01 and 2007-02-02


## Uploading the manually trimmed dataset into R
HH_Consump <- read.csv("household_power_consumptionTRIM.txt", sep=';', na.strings="?", header=T, nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


## See the Top and Bottom rows of the uploaded data file
head(HH_Consump)
tail(HH_Consump)


## Create plot 1 - Histogram showing Global Active Power (kilowatts) vs Frequency 
## Title: Global Active Power
## X-Axis Label: Global Active Power (kilowatts)
## Y-Axis Label: Frequency
hist(HH_Consump$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the Historgramm as a png file of the sixe 480 x 480 pixels
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
