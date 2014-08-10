temp <- read.table("./HHdata.txt", header = T, sep = ";", na.strings = "?",
                   nrows = 10)
mynames <- names(temp)
tabA <- read.table("./HHdata.txt", header = F, sep = ";", 
                   na.strings = "?", skip = 66638, nrows= 2880, comment.char="", 
                   colClasses= "character", col.names = mynames)
tabA[,10] <- as.POSIXct(paste(tabA[,1], tabA[,2]), format = "%d/%m/%Y %H:%M:%S")
tabB <- tabA[, c(10,3,4,5,6,7,8,9)]
colnames(tabB)[1] <- "Time"

png("plot2.png", width = 480, height = 480)
plot(tabB[,1], tabB[,2], type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()