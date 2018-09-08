View(airquality)
median(airquality$Ozone,na.rm=T)
mean(airquality$Ozone,na.rm=T)
data_airquality<-airquality
View(data_airquality)
is.na(data_airquality)
sum(is.na(data_airquality))
colSums(is.na(data_airquality))
sapply(data_airquality, is.na)
apply(data_airquality, 2, colSums)
replace<- ifelse(is.na(data_airquality$Ozone), median(data_airquality$Ozone,na.rm=T), data_airquality$Ozone)
View(replace)
sum(is.na(replace))
data_airquality$Ozone<-replace
data_airquality
sum(is.na(data_airquality$Ozone))
colSums(is.na(data_airquality))
replace1<- ifelse(is.na(data_airquality$Solar.R)==T, median(data_airquality$Solar.R,na.rm=T),data_airquality$Solar.R)
replace1
sum(is.na(replace1))
data_airquality$Solar.R<- replace1
data_airquality
colSums(is.na(data_airquality))
mean(data_airquality$Ozone)
median(data_airquality$Ozone)
replace3<- ifelse(is.na(data_airquality$Ozone), mean(data_airquality$Ozone,na.rm=T), data_airquality$Ozone)
replace3
data_airquality$Ozone<-replace3
replace4<- ifelse(is.na(data_airquality$Solar.R)==T, mean(data_airquality$Solar.R,na.rm=T),data_airquality$Solar.R)
replace4
data_airquality$Solar.R<- replace4
