# Data was prepared before generating plot (see data-wrangle.R)
df <- readRDS('prepared-data.rds')

png('plot2.png',width = 480, height = 480)
plot(df$Datetime,df$Global_active_power,type = 'l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
