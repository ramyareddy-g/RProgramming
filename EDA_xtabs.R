library(readxl)
Data<- read_excel("/Users/santosh/Desktop/DataforEDA.xlsx")
xtabs(~Data$`Total Length of Fwd Packets`, data= Data)
percent<- (xtabs(~Data$`Total Length of Fwd Packets`)/sum(xtabs(~Data$`Total Length of Fwd Packets`))*100)
percent
library(sqldf)
rest<- sqldf("select `Total Length of Fwd Packets` from Data where `Total Length of Fwd Packets`> 0")
rest
table(rest)
class(rest)

mean(rest$`Total Length of Fwd Packets`)
median(rest$`Total Length of Fwd Packets`)
replace<-ifelse(Data$`Total Length of Fwd Packets`==0, median(rest$`Total Length of Fwd Packets`), Data$`Total Length of Fwd Packets`)
replace
if(Data$`Total Length of Fwd Packets`==0) {
  print("0 is found")
} else {
  print("0 is not found")
}
  