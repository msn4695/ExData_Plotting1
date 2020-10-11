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

png("plot1.png", height=480, width=480, units="px")

hist(as.numeric(power$global_active_power), 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
)

dev.off()

rm(power)

# =================================== End ======================================

