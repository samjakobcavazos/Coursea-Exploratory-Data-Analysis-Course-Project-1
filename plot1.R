df <- read.csv('exdata_data_household_power_consumption/household_power_consumption.txt',sep=';',stringsAsFactors = FALSE)

# Change df$date to date type
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')

# Filter by date
df <- df[df$Date >= '2007-02-01' & df$Date <= '2007-02-02',]

# Change variable types
for (i in 3:9){
  df[,i] <- as.numeric(df[,i])
}

# Generate the first plot
png(file = 'plot1.png',width = 480, height = 480)
hist(df$Global_active_power,col='red',xlab = 'Global Active Power (kilowatts)',ylab = 'Frequency',main='Global Active Power')
dev.off() 
