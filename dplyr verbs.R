#method1 using dplyr data table manipulating functions
library(dplyr)
str(AdultUCI)
AdultUCI$sex<-as.character(AdultUCI$sex)
class(AdultUCI$sex)

#select and filter functions
adult_new<- select(AdultUCI, age, sex, race)
adult_new
result<-filter(adult_new, age<50 & sex== "Female"& race== "Black" )
dim(result)

# dplyr functions group by, arrange, summarise

pf<- read.csv("/Users/santosh/Downloads/pseudo_facebook.tsv", sep = "\t")
names(pf)

age_groups<- pf %>% group_by(age) 
age_groups
gist<- age_groups %>% summarise(avg_friend_count= mean(friend_count),
                                median_frnd_count=median(friend_count),
                                count= n(),
                                avg_friend_intiated= mean(friendships_initiated),
                                median_frnd_intiated=median(friendships_initiated))
gist<- gist %>% arrange(age)                         
head(gist, n=20)
