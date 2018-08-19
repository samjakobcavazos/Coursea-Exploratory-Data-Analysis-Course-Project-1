# Download the data from the Coursera site. Unfortunately it is too large to upload over github
df <- read.csv('exdata_data_household_power_consumption/household_power_consumption.txt',sep=';',stringsAsFactors = FALSE)

# Change df$date to date type
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')

# Filter by date
df <- df[df$Date >= '2007-02-01' & df$Date <= '2007-02-02',]

# Change variable types
df[,3:9] <- lapply(df[,3:9],as.numeric)

df$Datetime <- strptime(paste0(df$Date,df$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

saveRDS(df,'prepared-data.rds')