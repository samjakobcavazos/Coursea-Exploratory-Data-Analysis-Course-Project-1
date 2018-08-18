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

png('plot2.png',width = 480, height = 480)
plot(df$Datetime,df$Global_active_power,type = 'l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
