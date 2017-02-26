# Reading data into R

filename <- "./power_cons.zip" #zippedfile name

## check whether file exists and download the file:


# Unzip folder
if (!file.exists("household")) { 
     unzip(filename) 
}
data<-read.table("./household.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dim(data)


names(data)
head(data)
#subsetting data for February

febdata<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dim(febdata)
submetering1 <- as.numeric(febdata$Sub_metering_1)
submetering2 <- as.numeric(febdata$Sub_metering_2)
submetering3 <- as.numeric(febdata$Sub_metering_3)

date_time <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#drawing a graph
png("plot3.png", width = 480, height = 480)

plot(date_time,submetering1, type="l", xlab="", ylab="Energy sub metering")                                
lines(date_time,submetering2, type="l", col = "red")
lines(date_time,submetering3, type="l", col = "blue")

legend("topright", pch = 1, col = c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#creating png file


dev.off() #turn off graphic device
