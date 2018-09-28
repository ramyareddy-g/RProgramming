library(readxl)
Tele<-read.csv("F:/aravind/R/assignment/TCC.csv")
View(Tele)
Tele$gender<-ifelse(Tele$gender=="Male",1,2)
View(Tele$gender)
Tele$Partner<-ifelse(Tele$Partner=="Yes",1,0)
Tele$Dependents<-ifelse(Tele$Dependents=="Yes",1,0)
Tele$PhoneService<-ifelse(Tele$PhoneService=="Yes",1,0)
Tele$MultipleLines<-ifelse(Tele$MultipleLines=="No phone service",0,
                           ifelse(Tele$MultipleLines=="Yes",1,2))
Tele$InternetService<-ifelse(Tele$InternetService=="DSL",3,
                             ifelse(Tele$InternetService=="Fiber optic",4,0))
Tele$OnlineSecurity<-ifelse(Tele$OnlineSecurity=="No internet service",3,
                             ifelse(Tele$OnlineSecurity=="Yes",1,2))

Tele$OnlineBackup<-ifelse(Tele$OnlineBackup=="No internet service",3,
                            ifelse(Tele$OnlineBackup=="Yes",1,2))
Tele$DeviceProtection<-ifelse(Tele$DeviceProtection=="No internet service",3,
                            ifelse(Tele$DeviceProtection=="Yes",1,2))
Tele$TechSupport<-ifelse(Tele$TechSupport=="No internet service",3,
                            ifelse(Tele$TechSupport=="Yes",1,2))
Tele$StreamingTV<-ifelse(Tele$StreamingTV=="No internet service",3,
                            ifelse(Tele$StreamingTV=="Yes",1,2))
Tele$StreamingMovies<-ifelse(Tele$StreamingMovies=="No internet service",3,
                            ifelse(Tele$StreamingMovies=="Yes",1,2))
Tele$Contract<-ifelse(Tele$Contract=="Month-to-month",3,
                            ifelse(Tele$Contract=="One year",1,2))
Tele$PaperlessBilling<-ifelse(Tele$PaperlessBilling=="Yes",1,0)
Tele$PaymentMethod<-ifelse(Tele$PaymentMethod=="Bank transfer (automatic)",1,
                           ifelse(Tele$PaymentMethod=="Credit card (automatic)",2,
                                  ifelse(Tele$PaymentMethod=="Electronic check",3,4)))
Tele$Churn<-ifelse(Tele$Churn=="Yes",1,0)
View(Tele)
library(xlsx)
write.csv(Tele,"F:/aravind/R/assignment/TCC1.csv")


library(readxl)
Tele<-read.csv("F:/aravind/R/assignment/TCC1.csv")
library(caret)
names(Tele)
sample<- createDataPartition(Tele$Churn, p=0.7, list=F)
sample
train<- Tele[sample, ]
train
test<- Tele[-sample, ]
test
dim(train)
dim(Tele)
dim(test)
View(train)

train<- train[-c(1,2)]
dim(train)
test<- test[-c(1,2)]
dim(test)
library(ResourceSelection)
#building model
log_model<- glm(Churn~., data = train, family="binomial")
log_model
summary(log_model)
train1<- subset(train, select= -c(1,3))
View(train1)
log_model1<- glm(Churn~., data= train1, family= "binomial")
log_model1
#backward model
b_mod<- step(log_model1, direction = "backward")
b_mod
summary(b_mod)
#selected log_model1
obs<- predict(log_model1, newdata= test)
View(obs)
plot(obs)
results<- ifelse(obs>=0.5, 1, 0)
View(results)
df<- data.frame(Actual= test$Churn,Observed= results )
View(df) 
confusion_matrix<- table(df$Actual, df$Observed)
confusion_matrix
class(confusion_matrix)
mat<-as.matrix(confusion_matrix)
mat
class(mat)
#method1
add<- sum(diag(mat))/sum(mat)
add
#method2
efficiency<- (mat[1,1]+ mat[2,2])/sum(mat)
efficiency
xtabs(~Tele$Churn)
xtabs(~test$Churn)
table(train$Churn)
