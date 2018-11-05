library(dslabs)
data("airquality")
airquality
#question 1
is.na(airquality$Solar.R)
sum(is.na(airquality$Solar.R))
#quesn 2
data("iris")
iris
class(iris$Species)
nlevels(iris$Species)
str(iris$Species)
levels(iris$Species)
#quesn 3
data("mtcars")
View(mtcars)
mtcars[1]
xtabs(~mtcars$mpg + mtcars$gear)
xtabs(~mtcars$mpg)
table(mtcars$mpg)
sum(mtcars$mpg)
library(sqldf)
gear3mpg<- sqldf("select mpg from mtcars where gear = 3")
gear3mpg
nrow(gear3)
avgMPG_gear3<- sum(gear3)/nrow(gear3)
avgMPG_gear3
gear4mpg<- sqldf("select mpg from mtcars where gear = 4")
gear4mpg
avgMPG_gear4<- sum(gear4mpg)/nrow(gear4mpg)
avgMPG_gear4
gear5mpg<- sqldf("select mpg from mtcars where gear = 5")
gear5mpg
avgMPG_gear5<- sum(gear5mpg)/nrow(gear5mpg)
avgMPG_gear5
xtabs(~mtcars$mpg + mtcars$cyl)
cyl4mpg<- sqldf("Select mpg from mtcars where cyl=4")
cyl4mpg
avgMPG_cyl4<- sum(cyl4mpg)/nrow(cyl4mpg)
avgMPG_cyl4
cyl6mpg<- sqldf("Select mpg from mtcars where cyl=6")
cyl6mpg
avgMPG_cyl6<- sum(cyl6mpg)/nrow(cyl6mpg)
avgMPG_cyl6
cyl8mpg<- sqldf("Select mpg from mtcars where cyl=8")
cyl8mpg
avgMPG_cyl8<- sum(cyl8mpg)/nrow(cyl8mpg)
avgMPG_cyl8

#quesn 4
library(arules)
data("AdultUCI")
#table(AdultUCI$age, AdultUCI$sex)
# number of females who are <50 and are black
#table(AdultUCI$age, AdultUCI$sex)
#method
library(sqldf)
age50<- sqldf("select age, sex, race from AdultUCI where age<50 AND race=='Black'")
age50
str(age50)
summary(age50)
xtabs(~ age50$sex + age50$race)
#quesn 5
library(readxl)
forbes<- read_excel("/Users/santosh/Desktop/forbes.xlsx")
forbes
str(forbes)
Rank1<- as.numeric(Rank)


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

# quesn 7
1330/4000
690/4000
1365/1620
240/1050
1365/4000
810/1050
1135/4000
1135/1330
1620/4000
1050/4000

#quesn 9
library(caret)
library(corrplot)
day_data<- read_excel("/Users/santosh/Desktop/day.xlsx")
day_data
day_index<- createDataPartition(day_data$cnt, p=0.547, list= F)
day_index
sample_day<- day_data[day_index, ]
sample_day
hour_data<- read_excel("/Users/santosh/Desktop/hour.xlsx")
hour_data
hour_index<- createDataPartition(hour_data$cnt, p= 0.023, list = F)
hour_index
sample_hour<- hour_data[hour_index, ]
sample_hour
summary(sample_day$casual)
summary(sample_day$registered)
summary(sample_hour$casual)
summary(sample_hour$registered)
boxplot(sample_day$casual, ylab= "no. of casual users", col = "blue")
boxplot.stats(sample_day$casual)
#histogram
hist(sample_day$registered,xlab = "number of registered users", main = "Histogram of registered users for day sample data", col = "green" )
hist(sample_day$temp, xlab = "temperature", main = "Histogram of Temperature for day sample", col = "orange")
