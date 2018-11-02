library(ggplot2)
library(corrplot)
library(caret)
library(MASS)
sample<- createDataPartition(mtcars$mpg, p=0.70, list=F)
sample
train<- mtcars[sample, ]
train
dim(train)
dim(mtcars)
test<- mtcars[-sample, ]
test
dim(test)
lm1<- lm(mpg~disp, data=train)
lm1
summary(lm1)
pred1<- predict(lm1, newdata = test)
pred1

str(pred1)
cor(test$mpg,pred1)

par(mfrow=c(2,2))

plot(lm1)


