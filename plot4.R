temp <- read.table("./HHdata.txt", header = T, sep = ";", na.strings = "?",
                   nrows = 10)
mynames <- names(temp)
tabA <- read.table("./HHdata.txt", header = F, sep = ";", 
                   na.strings = "?", skip = 66638, nrows= 2880, comment.char="", 
                   colClasses= "character", col.names = mynames)
tabA[,10] <- as.POSIXct(paste(tabA[,1], tabA[,2]), format = "%d/%m/%Y %H:%M:%S")
tabB <- tabA[, c(10,3,4,5,6,7,8,9)]
colnames(tabB)[1] <- "Time"

png("plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))

plot(tabB[,1], tabB[,2], type = "l", xlab = "", 
     ylab = "Global Active Power")

plot(tabB[,1], tabB[,4], type = "l", xlab = "datetime", 
     ylab = "Voltage")

plot(tabB[,1], tabB[,6], type = "l", xlab = "", ylab = "Energy sub metering",
     col = "black")
lines(tabB[,1], tabB[,7], type ="l", col = "red")
lines(tabB[,1], tabB[,8], type ="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

plot(tabB[,1], tabB[,3], type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()