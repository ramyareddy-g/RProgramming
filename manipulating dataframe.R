library(dslabs)
library(dplyr)
data("murders")
str(murders)
#adding column murder_rate to the data table
murders<- mutate(murders, murder_rate= (total/population)*100000)
murders
str(murders)
