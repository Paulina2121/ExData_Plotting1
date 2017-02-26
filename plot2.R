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
globalActivePower <- as.numeric(febdata$Global_active_power)
date_time <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#drawing a graph
png("plot2.png", width = 480, height = 480)
plot(date_time,globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")                                



dev.off() #turn off graphic device
