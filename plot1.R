library(dplyr)
## Reading in "household_power_consumption.txt"
household <- read.table("household_power_consumption.txt", sep=";",
                        stringsAsFactors = FALSE, header=TRUE, na.strings = "?")
household$Time <- paste(household$Date,household$Time,sep=" ")
household <- tbl_df(household)
household$Date <- as.Date(household$Date,format="%d/%m/%Y")
household$Time <- strptime(household$Time, format = "%d/%m/%Y %H:%M:%S")

