library(ggplot2)
Requests <- read.csv("Requests.csv", stringsAsFactors = F)
attach(Requests)
s <- data.frame(Requests$OPEN_DT,Requests$TYPE,Requests$land_usage,stringsAsFactors=F)
colnames(s) <- c("opendt","type","land")
head(s)
s$opendt[1:10]
year <-substr(s$opendt, start=9, stop=10)
month <-substr(s$opendt,start=1,stop=2)
s$yymm <- paste(year,month,sep="")
table(s$yymm)
tail(s)
#Q1 months and number of requests pattern.
qplot(s$yymm)

#Q2 In each month, time and number of requests.
#Convert AM/PM to 24h
a <- substr(s$opendt,start=12,stop=22)
s$hour <- substr(strptime(a, "%I:%M:%S %p"),start=12,stop=13)
s$month <- substr(s$opendt,start=1,stop=2)
#Check
tail(s)
p <- qplot(data=s, x=hour,geom="histogram")
p + facet_wrap(~ month,ncol=2)

#Q3 months and number of requests, filled by land usage.
s$month <-substr(s$opendt,start=1,stop=2)
qplot(data=s,x=month,fill=s$land)

#Q4 months and number of requests, filled by types of requests

type<-table(s$type)
type.names<-names(type)
type.numers<-as.numeric(type)
type.table<-as.data.frame(cbind(type.names,type.numers))
class(type.table)
head(type.table)
type<-type.table[order(-type.numers),]
head(type)

qplot(data=s,x=month,fill=)





