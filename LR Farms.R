library(readxl)
library(MASS)
library(ResourceSelection)
library(lmtest)
library(caret)
Data<-read_excel("H:\\R Works\\Farms.xlsx")
View(Data)
Data1<-subset(Data,select = -c(id,status,varieties,bimas,region))
View(Data1)
library(corrplot)
corrplot(cor(Data1))
#Taking Sample
Farm<-createDataPartition(Data$price,p=0.7,list = F)
View(Farm)
#sample data
Train<-Data1[Farm,]
View(Train)
dim(Train)
dim(Data1)
#remaining data
Test<-Data1[-Farm,]
View(Test)
dim(Test)
#boxplot
boxplot(Train)
#find missing values
is.na(Train)
colSums(is.na(Train))
#finding 0's
xtabs(~Train$size,data=Train)
xtabs(~Train$seed,data=Train)
xtabs(~Train$urea,data=Train)
xtabs(~Train$phosphate,data=Train)# 0's available
#removing 0's
library(sqldf)
Rem0<-sqldf('select phosphate from Train where phosphate>0')
View(Rem0)
class(Rem0)
Rep0<-ifelse(Train$phosphate==0,median(Rem0$phosphate),Train$phosphate)
Rep0
Train$phosphate<-Rep0
xtabs(~Train$phosphate,data = Train)
xtabs(~Train$pesticide,data=Train) # 0's available
#removing 0's
RemP0<-sqldf('select pesticide from Train where pesticide>0')
View(RemP0)
class(RemP0)
RepP0<-ifelse(Train$pesticide==0,median(RemP0$pesticide),Train$pesticide)
RepP0
Train$pesticide<-RepP0
xtabs(~Train$pesticide,data = Train)
xtabs(~Train$pseed,data=Train)
xtabs(~Train$purea,data=Train)
xtabs(~Train$pphosph, data=Train)
xtabs(~Train$hiredlabor, data=Train)
xtabs(~Train$famlabor, data=Train)
xtabs(~Train$totlabor, data=Train)
xtabs(~Train$wage, data=Train)
xtabs(~Train$goutput, data=Train)
xtabs(~Train$noutput, data=Train)
xtabs(~Train$price, data=Train)
#finding outliars
library(quantreg)
q<- rq(price~.,data = Train,tau = 0.9)
q
plot(q)
pre<- predict(q,newdata = Test)
pre
df<-data.frame(actual=Test$price,observed=pre)
View(df)
cor(df$actual,df$observed)



