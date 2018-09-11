library(readxl)
Data<- read_excel("/Users/santosh/Desktop/DataforEDA.xlsx")
xtabs(~Data$`Total Length of Fwd Packets`, data= Data)
percent<- (xtabs(~Data$`Total Length of Fwd Packets`)/sum(xtabs(~Data$`Total Length of Fwd Packets`))*100)
percent
library(sqldf)
#calculate median for non 0 data
rest<- sqldf("select `Total Length of Fwd Packets` from Data where `Total Length of Fwd Packets`> 0")
rest
table(rest)
class(rest)

mean(rest$`Total Length of Fwd Packets`)
median(rest$`Total Length of Fwd Packets`)
#replace 0 with median value
replace<-ifelse(Data$`Total Length of Fwd Packets`==0, median(rest$`Total Length of Fwd Packets`), Data$`Total Length of Fwd Packets`)
replace
#if(Data$`Total Length of Fwd Packets`==0) 
 # {
  #print("0 is found")
#} else {
 # print("0 is not found")
#}

table(replace)
#assign replace to Data
Data$`Total Length of Fwd Packets`<-replace
Data$`Total Length of Fwd Packets`
table(Data$`Total Length of Fwd Packets`)


# calculate 0's for Total Length of Bwd Packets
xtabs(~Data$`Total Length of Bwd Packets`, data = Data)
percent1<- (xtabs(~Data$`Total Length of Bwd Packets`)/sum(xtabs(~Data$`Total Length of Bwd Packets`))*100)
percent1  
#calculate median for non-0 data
rest1<- sqldf("select `Total Length of Bwd Packets` from Data where `Total Length of Bwd Packets`>0")
rest1
median(rest1$`Total Length of Bwd Packets`)
replace1<- ifelse(Data$`Total Length of Bwd Packets`==0, median(rest1$`Total Length of Bwd Packets`), Data$`Total Length of Bwd Packets`)
replace1
View(replace1)
Data$`Total Length of Bwd Packets`<- replace1
Data$`Total Length of Bwd Packets`
str(Data$`Total Length of Bwd Packets`)
class(Data$`Total Length of Bwd Packets`)
# Forward Packet Length Max
xtabs(~Data$`Fwd Packet Length Max`)
percent2<- (xtabs(~Data$`Fwd Packet Length Max`)/sum(xtabs(~Data$`Fwd Packet Length Max`))*100)
percent2
rest2<- sqldf("select `Fwd Packet Length Max` from Data where `Fwd Packet Length Max`>0")
rest2
table(rest2)
median(rest2$`Fwd Packet Length Max`)
replace2<- ifelse(Data$`Fwd Packet Length Max`==0, median(rest2$`Fwd Packet Length Max`), Data$`Fwd Packet Length Max`)
replace2
Data$`Fwd Packet Length Max`<- replace2
Data$`Fwd Packet Length Max`
# Fwd Packet Length Min
xtabs(~Data$`Fwd Packet Length Min`)
percent3<- (xtabs(~Data$`Fwd Packet Length Min`)/sum(xtabs(~Data$`Fwd Packet Length Min`))*100)
percent3
rest3<- sqldf("select `Fwd Packet Length Min` from Data where `Fwd Packet Length Min`>0  ")
rest3
table(rest3)
median(rest3$`Fwd Packet Length Min`)
replace3<- ifelse(Data$`Fwd Packet Length Min`==0, median(rest3$`Fwd Packet Length Min`), Data$`Fwd Packet Length Min`)
replace3
Data$`Fwd Packet Length Min`<- replace3
Data$`Fwd Packet Length Min`
table(Data$`Fwd Packet Length Min`)
View(Data$`Fwd Packet Length Min`)
# `Backward Packet Length Max`
xtabs(~Data$`Bwd Packet Length Max`)
percent4<- (xtabs(~Data$`Bwd Packet Length Max`)/sum(xtabs(~Data$`Bwd Packet Length Max`))*100)
percent4
rest4<- sqldf("select `Bwd Packet Length Max` from Data where `Bwd Packet Length Max`>0  ")
rest4
table(rest4)
median(rest4$`Bwd Packet Length Max`)
replace4<- ifelse(Data$`Bwd Packet Length Max`==0, median(rest4$`Bwd Packet Length Max`), Data$`Bwd Packet Length Max`)
replace4
Data$`Bwd Packet Length Max`<- replace4
Data$`Bwd Packet Length Max`
table(Data$`Bwd Packet Length Max`)
# Backward Packet Length Min
xtabs(~Data$`Bwd Packet Length Min`)
percent5<- (xtabs(~Data$`Bwd Packet Length Min`)/sum(xtabs(~Data$`Bwd Packet Length Min`))*100)
percent5
rest5<- sqldf("select `Bwd Packet Length Min` from Data where `Bwd Packet Length Min`>0  ")
rest5
table(rest5)
median(rest5$`Bwd Packet Length Min`)
replace5<- ifelse(Data$`Bwd Packet Length Min`==0, median(rest5$`Bwd Packet Length Min`), Data$`Bwd Packet Length Min`)
replace5
Data$`Bwd Packet Length Min`<- replace5
Data$`Bwd Packet Length Min`
table(Data$`Bwd Packet Length Min`)
# Flow IAT Max
xtabs(~Data$`Flow IAT Max`)
percent6<- (xtabs(~Data$`Flow IAT Max`)/sum(xtabs(~Data$`Flow IAT Max`))*100)
percent6
rest6<- sqldf("select `Flow IAT Max` from Data where `Flow IAT Max`>0  ")
rest6
table(rest6)
median(rest6$`Flow IAT Max`)
mean(rest6$`Flow IAT Max`)
replace6<- ifelse(Data$`Flow IAT Max`==0, median(rest6$`Flow IAT Max`), Data$`Flow IAT Max`)
replace6
Data$`Flow IAT Max`<- replace6
Data$`Flow IAT Max`
table(Data$`Flow IAT Max`)
# Flow IAT Min
xtabs(~Data$`Flow IAT Min`)
percent7<- (xtabs(~Data$`Flow IAT Min`)/sum(xtabs(~Data$`Flow IAT Min`))*100)
percent7
rest7<- sqldf("select `Flow IAT Min` from Data where `Flow IAT Min`>0  ")
rest7
table(rest7)
median(rest7$`Flow IAT Min`)
mean(rest7$`Flow IAT Min`)
replace7<- ifelse(Data$`Flow IAT Min`==0, median(rest7$`Flow IAT Min`), Data$`Flow IAT Min`)
replace7
Data$`Flow IAT Min`<- replace7
Data$`Flow IAT Min`
table(Data$`Flow IAT Min`)
# Destination port
xtabs(~Data$`Destination Port`)
percent8<- (xtabs(~Data$`Destination Port`)/sum(xtabs(~Data$`Destination Port`))*100)
percent8
rest8<- sqldf("select `Destination Port` from Data where `Destination Port`>0  ")
rest8
table(rest8)
median(rest8$`Destination Port`)
mean(rest8$`Destination Port`)
replace8<- ifelse(Data$`Destination Port`==0, median(rest8$`Destination Port`), Data$`Destination Port`)
replace8
Data$`Destination Port`<- replace8
Data$`Destination Port`
table(Data$`Destination Port`)
summary(Data)
# Flow duration
xtabs(~Data$`Flow Duration`)
percent9<- (xtabs(~Data$`Flow Duration`)/sum(xtabs(~Data$`Flow Duration`))*100)
percent9
#Flow byte
xtabs(~Data$`Flow Bytes/s`)
percent10<- (xtabs(~Data$`Flow Bytes/s`)/sum(xtabs(~Data$`Flow Bytes/s`))*100)
percent10
rest10<- sqldf("select `Flow Bytes/s` from Data where `Flow Bytes/s`>0")
rest10
median(rest10$`Flow Bytes/s`)
mean(rest10$`Flow Bytes/s`)
replace10<- ifelse(Data$`Flow Bytes/s`==0, median(rest10$`Flow Bytes/s`), Data$`Flow Bytes/s`)
replace10
table(replace10)
Data$`Flow Bytes/s`<- replace10
Data$`Flow Bytes/s`
mean(Data$`Flow Bytes/s`)
