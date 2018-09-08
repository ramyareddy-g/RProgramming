library(readr)
data<-read.csv("/Users/santosh/Desktop/salary.csv")
View(data)
sapply(data, mean)
str(data)
summary(data)
mean(data$salary,na.rm = T)
sum(is.na(data$salary))
class(data$salary)
a<-as.numeric(data$salary)
mean(a)
data$salary<-a
sapply(data, function(x)mean(x))
sapply(data, mean)
summary(data)
data1<- read.csv(file.choose(), header = T)
data1
names(data1)
View(data1)
?make.names

