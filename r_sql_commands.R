library(readxl)
data1<-read_excel("C:\\Users\\Unitech\\Desktop\\probability_table.xlsx")
data1
class(data1$TOTAL)
length(data1)
str(data1)
library(sqldf)
library(adplyr)
data2<-sqldf('SELECT M1,M2,M3,M4 FROM data1 union select sum(M1),sum(M2),sum(M3),sum(M4) FROM data1')
data2

data2<-rename(data1,DISABILITY= `DISABILITY GRADE`)
data2
View(data2)
data3<-rename(data1,DISABILITY= `DISABILITY GRADE`)
data3<- sqldf('select S1,S2, S3 from data1 union select sum(s1), sum(s2), sum(s3) from data1')
data3