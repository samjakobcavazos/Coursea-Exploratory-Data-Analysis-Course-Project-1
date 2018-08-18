df <- read.csv('exdata_data_household_power_consumption/household_power_consumption.txt',sep=';',stringsAsFactors = FALSE)

# Change df$date to date type
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')

# Filter by date
df <- df[df$Date >= '2007-02-01' & df$Date <= '2007-02-02',]

# Change variable types
for (i in 3:9){
  df[,i] <- as.numeric(df[,i])
}

df$Datetime <- strptime(paste0(df$Date,df$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(df$Datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

lines(df$Datetime, df$Sub_metering_2, type="l", col="red")

lines(df$Datetime, df$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
