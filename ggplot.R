library(dplyr)
library(sqldf)
library(ggplot2)
require(stats)
getwd()
pf<- read.csv("/Users/santosh/Downloads/pseudo_facebook.tsv", sep = "\t")
names(pf)

#ggplot histogram frien count
ggplot(aes(x= friend_count), data =pf)+
  geom_histogram(binwidth= 25)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))+
  facet_grid(~gender)


#omitting NA's graph
ggplot(aes(x= friend_count, fill= gender), data = subset(pf, !is.na(gender)))+
  geom_histogram(binwidth= 25)+
    scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))+
      facet_grid(~gender)
# determining which gender has the most friends count
table(pf$gender)
summary(pf$tenure)
#tenure plot
ggplot(aes(x= tenure/365, color= "black", fill= "green"), data= subset(pf, !is.na(gender)))+
  geom_histogram(binwidth = 0.25)+
  #scale_x_continuous(limits = c(0, 3600), breaks= c(0, 3600, 30))+
  facet_wrap(~gender)

#qplot
qplot(x= friend_count, data= pf, binwidth= 25)+
  scale_x_continuous(limits  = c(0,1000), breaks = seq(0,1000,50))


#age plot
pf$age
str(pf$age)

ggplot(aes(x= age, color= "black"), data = subset(pf, !is.na(gender)) )+
  geom_histogram(binwidth = 5)+
  scale_x_continuous(breaks = seq(0,120,5), limits = c(0, 120))+
  facet_wrap(~gender)
summary(pf$age)

sum(xtabs(~pf$friend_count + pf$gender))
#ggplot frequency polygon friend count

ggplot(aes(y= ..count../sum(..count..), x= friend_count), 
       data = subset(pf, !is.na(gender)))+
  geom_freqpoly(aes(col= gender))+
  scale_x_continuous(limits = c(0, 2000), breaks = seq(0,2100, 30))

  # ggplot freqpolygon www.likes
summary(pf$www_likes)

ggplot(aes(x= www_likes, col= gender), data= subset(pf, !is.na(gender)))+
  geom_freqpoly() +
  scale_x_log10()

#males www_likes count by function

by(pf$www_likes, pf$gender, sum)
