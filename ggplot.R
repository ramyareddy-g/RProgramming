library(ggplot2)
getwd()
pf<- read.csv("pseudo_facebook.tsv", sep = "\t")
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
#qplot
qplot(x= friend_count, data= pf, binwidth= 25)+
  scale_x_continuous(limits  = c(0,1000), breaks = seq(0,1000,50))
  
