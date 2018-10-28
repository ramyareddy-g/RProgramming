# to delete entries of missing values
library(naniar)
data<- data[complete.cases(data) , ]