library(dplyr)
library(sqldf)
library(ggplot2)
require(stats)
require(corrplot)
require(alr3)
library(tidyr)
library(reshape2)

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

#males www_likes count by function---> by function needs to call require(stats) 
# syntax: by(variable name, categorical variable, function)---> needed to perform on variable1 split by categorical variable )
by(pf$www_likes, pf$gender, sum)

# boxplot friend_count and gender

ggplot(aes( x= gender, y= friend_count), data= subset(pf, !is.na(gender)))+
  geom_boxplot(aes(col=gender)) +
  scale_y_continuous(limits = c(0,1000), breaks = seq(0, 1000,50))
  
# using coord cartesian to scale y axis
ggplot(aes( x= gender, y= friend_count), data= subset(pf, !is.na(gender)))+
  geom_boxplot(aes(col=gender)) +
  coord_cartesian(ylim= c(0,1000))

# finding numerical median values of friend count for both males and females
by(pf$friend_count, pf$gender, summary)
# So the output values matches to coord cartesian of boxplot

#on an average who intiated more friendships, males or femaleS?
names(pf)
by(pf$friendships_initiated, pf$gender, summary)

# plotting box plot
ggplot(aes(y= friendships_initiated, x= gender), data= subset(pf, !is.na(gender))) +
  geom_boxplot()+
  coord_cartesian(ylim = c(0,500))
  #scale_y_continuous(limits = c(0, 500))

#creating new variable mobile_check_in
summary(pf$mobile_likes)
summary(pf$mobile_likes>0)
pf$mobile_checkin<- NA
pf$mobile_checkin<- ifelse(pf$mobile_likes>0, 1, 0)
pf$mobile_checkin<- factor(pf$mobile_checkin)
table(pf$mobile_checkin)
str(pf$mobile_checkin)
length(pf$mobile_checkin)
a=nrow(filter(pf, mobile_checkin==1))
a
percentage<- a/length(pf$mobile_checkin)
percentage*100

#scatter plot age vs friend count
ggplot(aes(x= age, y= friend_count), data = pf)+
  geom_point ()
# to reduce the darkness of spots we are using aplha= 1/15, 
#i.e., for 15 friend count will result in one full black spot

ggplot(aes(x= age, y= friend_count), data = pf)+
  geom_point (alpha=1/20)
#to broaden peaks
ggplot(aes(x= age,  y=friend_count), data = pf)+
  xlim(13,90)+
  geom_point (alpha=1/15)+
  coord_trans(y= "sqrt")
#scatter plot friends intiated vs age
summary(pf$age)

ggplot(aes(x=age, y= friendships_initiated), data= pf)+
  geom_point( color= 'orange', alpha= 1/20, position = position_jitter(h=0))+
  coord_trans(y= 'sqrt')+
  scale_x_continuous(limits = c(13, 90), breaks = seq(13,90,7))


# dplyr functions group by, arrange, summarise
age_groups<- pf %>% group_by(age) 
age_groups
gist<- age_groups %>% summarise(avg_friend_count= mean(friend_count),
                         median_frnd_count=median(friend_count),
                         count= n(),
                         avg_friend_intiated= mean(friendships_initiated),
                         median_frnd_intiated=median(friendships_initiated))
gist<- gist %>% arrange(age)                         
head(gist, n=20)


# scatter plot for mean friend count and age in years
ggplot(aes(x= age, y= avg_friend_count), data= gist)+
  geom_line()+
  scale_x_continuous(limits = c(13, 90), breaks= seq(13,90,7))
by(gist$avg_friend_count, gist$age, summary)

# scatter plot for mean friend count and age in months
names(pf)
head(pf,20)

pf$age_with_months <- pf$age + (1 - pf$dob_month / 12)

pf$age_with_months <- with(pf, age + (1 - dob_month / 12))
pf$avg_friend_count<- gist$avg_friend_count

ggplot(aes(x=age_with_months, y= avg_friend_count), data = pf)+
  geom_point()




#calculating conditional means
# adding summary lines to the friend_count and age plot

ggplot(aes(x= age, y= friend_count), data=pf)+
  geom_point(color='orange', alpha= 1/20, position = position_jitter(h=0))+
  coord_cartesian(xlim = c(13,90))+
 
  geom_line(stat = "summary", fun.y= mean)+
  geom_line(stat = "summary", fun.y= quantile, fun.args= list(probs= 0.1), linetype= 2, color='blue')+
  geom_line(stat = "summary", fun.y= quantile, fun.args= list(probs= 0.9), linetype= 2, color='purple')+
  geom_line(stat = "summary", fun.y= quantile, fun.args= list(probs= 0.5), color='blue')

#finding correlation between age and friend count

cor.test(pf$age, pf$friend_count, method = 'pearson', alternative = 'less', exact = NULL, conf.level = 0.95)
#with function
with(pf, cor.test(age, friend_count, method = "pearson"))
#coorelation for ages upto 70
with(subset(pf, age<=70), cor.test(age, friend_count))

names(pf)
#scatter plot likes received vs www likes received
ggplot(aes(x= www_likes_received, y= likes_received), data= pf)+
  geom_point()+
  geom_abline(color='purple')
#mitchell data set
mitchell<- data("Mitchell")
?Mitchell
mitchell<- Mitchell
head(mitchell, 20)
ggplot(aes(y= Temp, x= Month), data = mitchell)+
  geom_point()
# correlation
cor(mitchell$Month, mitchell$Temp, method = 'pearson')
summary(mitchell$Month)
203/12
ggplot(aes(y= Temp, x= Month/12), data = mitchell)+
  geom_point()+
  scale_x_continuous(limits = c(0, 16), breaks =seq(0,16,1))

#summary statistics for friend count by age and gender

pf.fc_by_age_gender <- pf %>% group_by(age, gender) %>% summarise(mean_friend_count= mean(friend_count),
                                                    median_friend_count= median(friend_count),
                                                    n= n())

pf.fc_by_age_gender$gender<- ifelse(is.na(pf.fc_by_age_gender$gender), na.rm=T, pf.fc_by_age_gender$gender)

head(pf.fc_by_age_gender)

#median friend count and age by gender

ggplot(aes(x= age, y= median_friend_count, color= gender), data= subset(pf.fc_by_age_gender, !is.na(gender)))+
  geom_line()+
  scale_x_continuous(limits = c(13, 90), breaks = seq(13, 90, 7))

#reshaping dataset pf.fc_by_age_gender
spread(subset(pf.fc_by_age_gender, 
              select = c('gender', 'age', 'median_friend_count')), 
       gender, median_friend_count)

#creating age_with_months variable
pf$age_with_months<- with(pf, age +(1-pf$dob_month/12))
pf$age_with_months
pf$age_with_months <- pf$age + (1 - pf$dob_month / 12)

#creating dataframe pf.fc_by_age_months

age_year<- pf %>% group_by(age)
pf.fc_by_age_year<- age_year %>% summarise(mean1_friend_count= mean(friend_count),
                                                  med_friend_count= median(friend_count),
                                                  n= n())
pf.fc_by_age_year <-pf.fc_by_age_year %>% arrange(age_year)
head(pf.fc_by_age_year, 10)


age_with_months<- pf %>% group_by(age_with_months)

pf.fc_by_age_month<-age_with_months %>% summarise(friend_count_mean= mean(friend_count),
                                                  friend_count_median= median(friend_count),
                                                  n= n())
pf.fc_by_age_month <- arrange(pf.fc_by_age_month, age_with_months)
head(pf.fc_by_age_month, 10)

#line plot friend_count_mean versus age_with_months

ggplot(aes(x= age_with_months, y= friend_count_mean), 
       data = subset(pf.fc_by_age_month, age_with_months<71))+
  geom_line()

# smoothing conditional means
g1<- ggplot(aes(x= age, y= mean_friend_count), data= subset(pf.fc_by_age_gender, age<71))+
  geom_line()
g1


g2<-ggplot(aes(x= age_with_months, y= friend_count_mean), 
         data = subset(pf.fc_by_age_month, age_with_months<71))+
  geom_line()
g2

library(gridExtra)
grid.arrange(g1, g2, nrow=2)

