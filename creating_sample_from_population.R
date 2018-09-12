library(MASS)
mtcars
View(mtcars)
library(caret)
library(corrplot)
data<- createDataPartition(mtcars$hp, p=0.75, list = F)
View(data)
sample<-mtcars[data, ]
View(sample)
median(sample$hp)
cor(sample)
corrplot(cor(sample))
corrplot(cor(sample), method = "number")
boxplot(sample)
boxplot(sample$hp)
boxplot.stats(sample$hp)
boxplot.stats(sample$hp)$out
#method1
rep<- ifelse(sample$hp==335, NA, sample$hp)
View(rep)
class(rep)
as.data.frame(rep)
rep_na<- ifelse(is.na(rep), median(sample$hp, na.rm=T), rep)
rep_na
#or method 2
replace<- ifelse(sample$hp== 335, median(sample$hp), sample$hp)
replace
