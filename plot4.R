Sys.setlocale("LC_TIME", "English")
test<-read.table("household_power_consumption.txt", header=TRUE, nrows=70000, sep=";",stringsAsFactors=FALSE)
EPC<-test[test[,1] %in% c("1/2/2007","2/2/2007"),]
EPC[,10]<-paste(EPC[,1],EPC[,2]) 
EPC[,10]<-as.data.frame(strptime(EPC[,10], "%d/%m/%Y %H:%M:%S"))
EPC[,1]<-as.Date(EPC[,1],"%m/%d/%Y")
EPC[,3:9]<-sapply(EPC[,3:9],as.numeric)



png(file = "plot4.png",bg = "transparent" ) 
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(EPC, {
 hist(EPC[,3],col="red",main="", xlab="Global Active Power (kilowatts)")
 plot(EPC[,10],EPC[,5],type="l", ylab="Voltage", xlab="datetime")
 plot(EPC[,10],EPC[,7],type="l", ylab="Energy sub metering", xlab="")
	lines(EPC[,10],EPC[,8],type="l", col="red")
	lines(EPC[,10],EPC[,9],type="l", col="blue")
	legend("topright",bty = "n" ,lty=c(1,1),col=c("black","blue","red"),legend=colnames(EPC)[7:9])
plot(EPC[,10],EPC[,4],type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off() 