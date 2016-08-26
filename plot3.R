source("dl_data.R")

ds = read_hh_file()
options(scipen=11)

lb = as.Date("2007-02-01")
hb = as.Date("2007-02-02")

plot.new()
png(filename="plot3.png")
ds1 = ds[ds$Date >= lb & ds$Date <= hb, c("Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
yrange = range(c(min(ds1$Sub_metering_1), 
    min(ds1$Sub_metering_2),
    min(ds1$Sub_metering_3),
    max(ds1$Sub_metering_1), 
    max(ds1$Sub_metering_2), 
    max(ds1$Sub_metering_3)))

plot(range(ds1$Time), yrange, xlab = "", ylab="Energy sub metering") 
lines(x = as.integer(ds1$Time), y = ds1$Sub_metering_1, col="black")
lines(x = as.integer(ds1$Time), y = ds1$Sub_metering_2, col="red")
lines(x = as.integer(ds1$Time), y = ds1$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

