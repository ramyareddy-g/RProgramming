ranks<- c(1.5,2.5,3.5,4.5,5.5,6.5,7.6,8.7,9.4,10.7)
marks<- c(99,98,90,85,78,77,70,68,65,63)
df<- data.frame(ranks, marks)
df
cor(marks,ranks, method = "spearman")
cor(marks,ranks, method = "pearson")
cor(marks,ranks, method= "kendall")
