# FUNCTIONS AND JOINS PRACTICE
library(MASS)
View(Boston)
eda_data<-Boston
eda_data
View(eda_data)
names(eda_data)
dim(eda_data)
class(eda_data$crim)
str(eda_data)
class(eda_data$rad)
#head(df) returns top five rows
head(eda_data)
#tail(df) returns last five rows
tail(eda_data)
head(eda_data, n=150)
# maximum rows head() can return is 71
tail(eda_data, n= 72)
IQR(eda_data$crim)
count(eda_data$tax)
library(MASS)
library(dplyr)
ED.data<-mtcars
ED.data
View(ED.data)
cor(ED.data$mpg, ED.data$disp)
#pch value in scatter plot is for different styles of dots. 
# for eg: pch=19 is for thick round dot. generally this is preferred in industries
plot(ED.data$mpg,ED.data$disp, xlab= "mpg",ylab= "displacement", main="displacement vs mpg", col="purple", pch=20)
# boxplot does not have x axis
boxplot(ED.data$disp, ylab="displacement", col= "orange")
hist(ED.data$gear)
hist(ED.data$disp)
library(psych)
# psych library enables use of describe function
describe(ED.data$disp)
summary(ED.data$disp)
str(ED.data)
library(sqldf)
ED.data
table1<- sqldf("SELECT cyl, wt, qsec From `ED.data`")
table1
table2<- sqldf("SELECT cyl,disp,mpg From `ED.data`")
table2
#left.join<- sqldf("SELECT cyl,wt,qsec From table1 left join table2 on ")

#perform inner join in R
#by= col name, represents matching column in both tables
merge(table1, table2, by= c("cyl"))
#perform outer join
merge(table1, table2, by= c("cyl"), all= TRUE)
#perform left join
merge(table1, table2, by= c("cyl"), all.x = TRUE)
#perform right join
merge(table1, table2, by= c("cyl"), all.y = TRUE)
