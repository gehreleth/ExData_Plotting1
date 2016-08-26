read_hh_file <- function() {
  if (!dir.exists("./data")) {
    tmp = tempfile(pattern = "src")
    download.file(
      "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      tmp,
      mode = "wb"
    )
    dir.create("./data")
    unzip(tmp, exdir = "./data")
    file.remove(tmp)
  }
  table = read.csv("./data/household_power_consumption.txt", sep = ";")
  table[,2] <- as.POSIXct(paste(table[,1], table[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")
  table[,1] <- as.Date(table[,1], "%d/%m/%Y")
  table[,3] <- suppressWarnings(as.numeric(as.character(table[,3])))
  table[,4] <- suppressWarnings(as.numeric(as.character(table[,4])))
  table[,5] <- suppressWarnings(as.numeric(as.character(table[,5])))
  table[,6] <- suppressWarnings(as.numeric(as.character(table[,6])))
  table[,7] <- suppressWarnings(as.numeric(as.character(table[,7])))
  table[,8] <- suppressWarnings(as.numeric(as.character(table[,8])))
  table[,9] <- suppressWarnings(as.numeric(as.character(table[,9])))
  table
}