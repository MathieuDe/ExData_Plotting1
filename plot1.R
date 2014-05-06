Sys.setlocale("LC_TIME", "English")
test<-read.table("household_power_consumption.txt", header=TRUE, nrows=70000, sep=";",stringsAsFactors=FALSE)
EPC<-test[test[,1] %in% c("1/2/2007","2/2/2007"),]
EPC[,10]<-paste(EPC[,1],EPC[,2]) 
EPC[,10]<-as.data.frame(strptime(EPC[,10], "%d/%m/%Y %H:%M:%S"))
EPC[,1]<-as.Date(EPC[,1],"%m/%d/%Y")
EPC[,3:9]<-sapply(EPC[,3:9],as.numeric)


#plot 1
png(file = "plot1.png",bg = "transparent" ) 
plot1<-hist(EPC[,3],col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 