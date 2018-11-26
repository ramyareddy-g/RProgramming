require(dplyr)
require(ggplot2)
require(readr)
pf<- read.csv("/Users/santosh/Downloads/pseudo_facebook.tsv", sep = "\t")

# summarising friend count by age and gender

pf.fc_by_age_gender<- pf %>% filter(!is.na(gender)) %>% group_by(age, gender) %>% summarise(mean_frnd_cnt= mean(friend_count),
                                                                 median_frnd_cnt= median(friend_count),
                                                                 n= n())
pf.fc_by_age_gender %>% ungroup() %>% arrange(age)
