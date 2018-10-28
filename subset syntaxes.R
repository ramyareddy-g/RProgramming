#getting and setting working directories
getwd()
setwd("~/Downloads")
getwd()
#reading data
state_data<- read.csv("stateData.csv")
#method 1 
region2<- subset(state_data, state.region==2)
region2
# method2 subsetting data
region3<- state_data[state_data$state.region==3, ]
region3
setwd("/Users/santosh/ramya/Programming/RProgramming")
getwd()
