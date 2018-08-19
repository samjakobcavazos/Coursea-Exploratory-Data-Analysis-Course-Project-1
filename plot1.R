# Data was prepared before generating plot (see data-wrangle.R)
df <- readRDS('prepared-data.rds')

# Generate the first plot
png('plot1.png',width = 480, height = 480)
hist(df$Global_active_power,col='red',xlab = 'Global Active Power (kilowatts)',ylab = 'Frequency',main='Global Active Power')
dev.off() 
