require(dplyr)
library(ggplot2)
require(readr)

# importing dataset pf

pf<- read.csv("/Users/santosh/Downloads/pseudo_facebook.tsv", sep = "\t")


# summarising friend count grouping by age and gender 

pf.fc_by_age_gender<- pf %>% filter(!is.na(gender))%>% 
  group_by(age, gender) %>% 
  summarise(mean_frnd_cnt= mean(friend_count),
                             median_frnd_cnt= median(friend_count),
                             n= n())

pf.fc_by_age_gender %>% ungroup() %>% arrange(age)



# reshaping long data to wide data using tidyr

library(tidyr)

pf.fc_by_age_gender.wide<- spread(subset(pf.fc_by_age_gender,
                                         select= c("age", "gender", "median_frnd_cnt")), gender, median_frnd_cnt)


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

