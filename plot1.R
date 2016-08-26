source("dl_data.R")

ds = read_hh_file()
options(scipen=11)

lb = as.Date("2007-02-01")
hb = as.Date("2007-02-02")

ds1 = ds[ds$Date >= lb & ds$Date <= hb,]$Global_active_power

plot.new()
png(filename="plot1.png")
hist(ds1, col = c("red"), main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
