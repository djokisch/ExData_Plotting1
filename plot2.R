library(dplyr)
library(lubridate)
## Reading in "household_power_consumption.txt"
household <- read.table("household_power_consumption.txt", sep=";",
                        stringsAsFactors = FALSE, header=TRUE, na.strings = "?")
household$Time <- paste(household$Date,household$Time,sep=" ")
household <- tbl_df(household)
## household$Date <- as.Date(household$Date,format="%d/%m/%Y")
## household$Time <- strptime(household$Time, format = "%d/%m/%Y %H:%M:%S")
household$Date <- dmy(household$Date)
household$Time <- dmy_hms(household$Time)

## Filtering out all rows except for those on the two days desired.
household <- filter(household, Date==as.Date("2007-02-01") |
                        Date==as.Date("2007-02-02"))

## Opening graphics device PNG
png("figure/plot2.png", width=480, height=480)

## Producing plot
plot(household$Time, household$Global_active_power,
      type="l",
      ylab="Global Active Power (kilowatts)",
      xlab="",
      pch=NA)

## Closing the graphics device
dev.off()