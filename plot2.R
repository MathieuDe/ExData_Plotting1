Sys.setlocale("LC_TIME", "English")
test<-read.table("household_power_consumption.txt", header=TRUE, nrows=70000, sep=";",stringsAsFactors=FALSE)
EPC<-test[test[,1] %in% c("1/2/2007","2/2/2007"),]
EPC[,10]<-paste(EPC[,1],EPC[,2]) 
EPC[,10]<-as.data.frame(strptime(EPC[,10], "%d/%m/%Y %H:%M:%S"))
EPC[,1]<-as.Date(EPC[,1],"%m/%d/%Y")
EPC[,3:9]<-sapply(EPC[,3:9],as.numeric)



png(file = "plot2.png",bg = "transparent" ) 
plot(EPC[,10],EPC[,3],type="l", ylab="Global Active Power (kilowatt)", xlab="")
dev.off() 