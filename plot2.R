source("dl_data.R")

ds = read_hh_file()
options(scipen=11)

lb = as.Date("2007-02-01")
hb = as.Date("2007-02-02")

plot.new()
png(filename="plot2.png")
ds1 = ds[ds$Date >= lb & ds$Date <= hb, c("Time", "Global_active_power")]
plot(range(ds1$Time), range(ds1$Global_active_power), xlab = "", ylab="Global Active Power (kilowatts)") 
lines(x = as.integer(ds1$Time), y = ds1$Global_active_power)
dev.off()
