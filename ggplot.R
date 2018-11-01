library(ggplot2)
getwd()
pf<- read.csv("pseudo_facebook.tsv", sep = "\t")
names(pf)
ggplot(aes(x= friend_count), data = pf)+
  geom_histogram()+
    scale_x_continuous(limits = c(0,1000))
