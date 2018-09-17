#quesn 6 a
library(readxl)
outbrk<- read_excel("/Users/santosh/Desktop/outbreak.xlsx")
outbrk
outbrk$ill
summary(outbrk$ill)
crosstab<- xtabs(~outbrk$age + outbrk$ill)
crosstab
class(crosstab)
df<- data.frame(crosstab)
names(df)
str(df)
outbrk.age<- as.numeric(df$outbrk.age)
class(outbrk.age)
summary(df)
library(sqldf)
levels(df$outbrk.ill)
hist(outbrk.age)
df1<- sqldf("select `outbrk.age` from df where `outbrk.ill`= 1")
df
?hist()
names(df)
sick<- sqldf("select `outbrk.age` from df where `outbrk.ill`== TRUE and outbrk.age< 50")
summary(xtabs(~outbrk$age + outbrk$ill))
icevanilla<- xtabs(~outbrk$ill + outbrk$vanilla)
icevanilla
icechocolate<- xtabs(~outbrk$ill + outbrk$chocolate)
icechocolate


# quess 6 b
#selecting columns only sick and ill
sick<- outbrk[c(2,4)]
sick
# we want only males(1) who are sick
sick_males<- sick[which(sick$sex==1 & sick$ill=="TRUE"), ]
sick_males
# sum of only males
sumM<- nrow(sick_males)
sumM
xtabs(~outbrk$sex)
people<- sum(xtabs(~outbrk$sex))
people
proportionM<- (sumM/people)*100
proportionM
#females
sick_females<- sick[which(sick$sex==2 & sick$ill== "TRUE"), ]
sick_females
sumF<- nrow(sick_females)
sumF
propF<- (sumF/people)*100
propF
#6c histogram sick
notwell<- outbrk[ ,c(1,4)]
notwell
Unwell<- notwell[which(notwell$ill== TRUE), ]
Unwell
class(Unwell$age)
age<- as.numeric(Unwell$age)
class(age)
hist(age, xlab = "sick ages", main = "Histogram of ages of sick people", col = "purple")
#histogram healthy
well<- subset(outbrk, select= c(1,4), outbrk$ill==FALSE)
well
age2<- as.numeric(well$age)
age2
hist(age2, xlab = "Healthy Ages", main = "Histogram of Ages of healthy people", col = "Orange")
#icecream
vanilla<- subset(outbrk, select= c(4,18), outbrk[4]==TRUE & outbrk[18]== TRUE)
vanilla
nrow(vanilla)
chocolate<- subset(outbrk, select= c(4,19), outbrk[4]==TRUE & outbrk[19]== TRUE)
chocolate
nrow(chocolate)
nrow(outbrk)
healthy_vanilla<- subset(outbrk, select= c(4,18), outbrk[4]==FALSE & outbrk[18]==TRUE)
healthy_vanilla
nrow(healthy_vanilla)
healthy_chocolate<- subset(outbrk, select= c(4,19), outbrk[4]==FALSE & outbrk[19]== TRUE)
healthy_chocolate
nrow(healthy_chocolate)
sum(nrow(vanilla)+ nrow(healthy_vanilla))
percentVanilla<- (nrow(vanilla)/sum(nrow(vanilla)+ nrow(healthy_vanilla)))*100
percentVanilla
percentChocolate<- (nrow(chocolate)/sum(nrow(chocolate)+nrow(healthy_chocolate)))*100
percentChocolate