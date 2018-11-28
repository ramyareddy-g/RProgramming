require(dplyr)
library(ggplot2)
require(readr)
pf<- read.csv("/Users/santosh/Downloads/pseudo_facebook.tsv", sep = "\t")
pf
# summarising friend count by age and gender

pf.fc_by_age_gender<- pf %>% filter(!is.na(gender)) %>% group_by(age, gender) %>% summarise(mean_frnd_cnt= mean(friend_count),
                                                                 median_frnd_cnt= median(friend_count),
                                                                 n= n())
pf.fc_by_age_gender %>% ungroup() %>% arrange(age)

# plotting third qualitative variable

ggplot(aes(x=age, y= friend_count, color= gender), data= subset(pf, !is.na(gender))) +
  geom_line()+
  stat_summary(fun.y= median)

summary(pf$friend_count)

# Create a line graph showing the
# median friend count over the ages
# for each gender. Be sure to use
# the data frame you just created,
# pf.fc_by_age_gender.


ggplot(aes(x= age, y= median_frnd_cnt, color= gender), data = subset(pf.fc_by_age_gender, !is.na(gender)))+
  geom_line()

# reshaping long data to wide data using tidyr

library(tidyr)

pf.fc_by_age_gender.wide<- spread(subset(pf.fc_by_age_gender,
                                       select= c("age", "gender", "median_frnd_cnt")), gender, median_frnd_cnt) %>% 
                                       mutate(ratio= female/male)


pf.fc_by_age_gender.wide

# reshaping long data to wide data using reshape2

library(reshape2)

pf.fc_by_age_gender.wide1<- dcast(pf.fc_by_age_gender,
                                  age~gender,
                                  value.var = 'median_frnd_cnt')
head(pf.fc_by_age_gender.wide1)

# reshaping using dplyr and tidyr

pf.fc_by_age_gender.wide3 <-
  subset(pf.fc_by_age_gender[c('age', 'gender', 'median_frnd_cnt')],
         !is.na(gender)) %>%
  spread(gender, median_frnd_cnt) %>%
  mutate(ratio = male / female)

head(pf.fc_by_age_gender.wide3)

# Plot the ratio of the female to male median
# friend counts using the data frame
# pf.fc_by_age_gender.wide.

?geom_hline
range(pf.fc_by_age_gender.wide$ratio)

c<- ggplot(aes(x= age, y= female/male), data = pf.fc_by_age_gender.wide)+
  geom_line(aes(color= 'black'))
c
c+geom_hline(yintercept = 1, color="blue", linetype= 2)

#plotting third quantitative variable

# Create a variable called year_joined
# in the pf data frame using the variable
# tenure and 2014 as the reference year.

# The variable year joined should contain the year
# that a user joined facebook.

pf$year_joined<- 2014-(pf$tenure/365)
pf$year_joined<- floor(pf$year_joined)

table(pf$year_joined)


?cut
# Create a new variable in the data frame
# called year_joined.bucket by using
# the cut function on the variable year_joined.

# You need to create the following buckets for the
# new variable, year_joined.bucket

#        (2004, 2009]
#        (2009, 2011]
#        (2011, 2012]
#        (2012, 2014]

pf$year_joined.bucket<- cut(pf$year_joined, c(2004,2009, 2011, 2012, 2014))
pf$year_joined.bucket
table(pf$year_joined.bucket)


# Create a line graph of friend_count vs. age
# so that each year_joined.bucket is a line
# tracking the median user friend_count across
# age. This means you should have four different
# lines on your plot.

# You should subset the data to exclude the users
# whose year_joined.bucket is NA.

ggplot(aes(x= age, y= friend_count), data = subset(pf, !is.na(year_joined.bucket)))+
  geom_line(aes(color= year_joined.bucket), stat= 'summary', fun.y = median)

# Write code to do the following:

# (1) Add another geom_line to code below
# to plot the grand mean of the friend count vs age.

# (2) Exclude any users whose year_joined.bucket is NA.

# (3) Use a different line type for the grand mean.

# As a reminder, the parameter linetype can take the values 0-6:

# 0 = blank, 1 = solid, 2 = dashed
# 3 = dotted, 4 = dotdash, 5 = longdash
# 6 = twodash


ggplot(aes(x= age, y= friend_count), data= subset(pf, !is.na(pf$year_joined.bucket)))+
  geom_line(aes(color= year_joined.bucket), stat= 'summary', fun.y= mean)+
  geom_line(stat = 'summary', linetype= 2, color= "blue")

names(pf)
#friend rate
rate<- with(subset(pf, tenure>0), summary(friend_count/tenure))
rate
# Create a line graph of mean of friendships_initiated per day (of tenure)
# vs. tenure colored by year_joined.bucket.

# You need to make use of the variables tenure,
# friendships_initiated, and year_joined.bucket.

# You also need to subset the data to only consider user with at least
# one day of tenure.

names(pf)
ggplot(aes(x= tenure, y= friendships_initiated/tenure), data = subset(pf, tenure>0 & !is.na(year_joined.bucket)))+
  geom_line(aes(color= year_joined.bucket), stat = 'summary', fun.y= mean)
#smoothening noise
ggplot(aes(x = 7 * round(tenure / 7), y = friendships_initiated / tenure),
       data = subset(pf, tenure > 0)) +
  geom_smooth(aes(color = year_joined.bucket),
              stat = "summary",
              fun.y = mean)







