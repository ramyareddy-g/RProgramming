library(readr)
library(dplyr)
library(ggplot2)
getwd()
yo<- read.csv("/Users/santosh/Downloads/yogurt.csv")
str(yo)
yo$id<- factor(yo$id)
#histogram yogurt prices
ggplot(aes(x= price), data = yo)+
  geom_histogram()
range(yo$price)
?transform
#creating new variable all purchases using transform function
yo<- transform(yo, all.purchases= strawberry+blueberry+pina.colada+plain+ mixed.berry)
#histogram
ggplot(aes(x= all.purchases), data = yo)+
  geom_histogram()
str(yo)
names(yo)

#scatter plot price vs time

ggplot(aes(x= time, y= price), data = yo)+
  geom_point()+
  scale_x_continuous(limits = c(9600, 10459), breaks = seq(9600, 10459, 100))

10459-9600

range(yo$time)
summary(yo$time)

# sampling 16 ids from yo data set
set.seed(45)
 sample.ids
# plot time vs price

ggplot(aes(x= time, y= price), data = subset(yo, id %in% sample.ids))+
  facet_wrap(~id)+
  geom_line()+
  geom_point(aes(size= all.purchases), pch=1)
      
range(yo$all.purchases)



