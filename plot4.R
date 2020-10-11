# loading data
# working directory must have "household_power_consumption.txt" file
# which contains the table

powerdata <- read.csv2("household_power_consumption.txt", na.strings = "?")

# names adjustment

names(powerdata) <- tolower(names(powerdata))

# Conversion of dates to Date class

powerdata$date <- as.Date(powerdata$date, format = "%d/%m/%Y")

# subsetting dataframe according to the given dates

power <- subset(powerdata, 
                powerdata$date >= "2007-02-01" & powerdata$date <= "2007-02-02")
rm(powerdata)

# plotting the variables

png("plot4.png", height=480, width=480, units="px")

par(mfrow=c(2,2))

with(power, plot(strptime(paste(date, time, sep=" "), 
                         format="%Y-%m-%d %H:%M:%S"), 
                as.numeric(global_active_power),
                type="l",
                xlab="",
                ylab="Global Active Power (kilowatts)"
))

with(power, plot(strptime(paste(date, time, sep=" "),
                         format="%Y-%m-%d %H:%M:%S"), 
                as.numeric(voltage),
                type="l",
                xlab="datetime",
                ylab="Voltage"
))

with(power, plot(
        strptime(paste(date, time, sep=" "), format="%Y-%m-%d %H:%M:%S"),
        as.numeric(sub_metering_1),
        col=1,
        type="l",
        xlab="",
        ylab="Energy Sub Metering",
))

with(power, lines(
        strptime(paste(date, time, sep=" "), format="%Y-%m-%d %H:%M:%S"),
        as.numeric(sub_metering_2),
        col="red"))

with(power, lines(
        strptime(paste(date, time, sep=" "), format="%Y-%m-%d %H:%M:%S"),
        as.numeric(sub_metering_3),
        col="blue"))

legend("topright", 
       lty=1, 
       col=c("black", "red", "blue"),
       bty="n",
       inset=c(0,0,1,4),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))

with(power, plot(strptime(paste(date, time, sep=" "), 
                         format="%Y-%m-%d %H:%M:%S"), 
                as.numeric(global_reactive_power),
                type="l",
                xlab="datetime",
                ylab="Global_reactive_power"
))

dev.off()

rm(power)

# =================================== End ======================================

