df <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header=T, stringsAsFactors = F)
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

df$DateTime <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width=480,height=480)

plot(df$DateTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2,col="red")
lines(df$DateTime,df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),lty = c(1, 1, 1),cex=.8)

dev.off()