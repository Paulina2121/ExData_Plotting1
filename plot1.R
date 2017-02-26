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

#drawing a histogram
png("./plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")                                

dev.off()
