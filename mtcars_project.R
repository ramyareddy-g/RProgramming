data("mtcars")
View(mtcars)
mtcars[1]
xtabs(~mtcars$mpg + mtcars$gear)
xtabs(~mtcars$mpg)
table(mtcars$mpg)
sum(mtcars$mpg)
library(sqldf)
gear3mpg<- sqldf("select mpg from mtcars where gear = 3")
gear3mpg
nrow(gear3)
avgMPG_gear3<- sum(gear3)/nrow(gear3)
avgMPG_gear3
gear4mpg<- sqldf("select mpg from mtcars where gear = 4")
gear4mpg
avgMPG_gear4<- sum(gear4mpg)/nrow(gear4mpg)
avgMPG_gear4
gear5mpg<- sqldf("select mpg from mtcars where gear = 5")
gear5mpg
avgMPG_gear5<- sum(gear5mpg)/nrow(gear5mpg)
avgMPG_gear5
xtabs(~mtcars$mpg + mtcars$cyl)
cyl4mpg<- sqldf("Select mpg from mtcars where cyl=4")
cyl4mpg
avgMPG_cyl4<- sum(cyl4mpg)/nrow(cyl4mpg)
avgMPG_cyl4
cyl6mpg<- sqldf("Select mpg from mtcars where cyl=6")
cyl6mpg
avgMPG_cyl6<- sum(cyl6mpg)/nrow(cyl6mpg)
avgMPG_cyl6
cyl8mpg<- sqldf("Select mpg from mtcars where cyl=8")
cyl8mpg
avgMPG_cyl8<- sum(cyl8mpg)/nrow(cyl8mpg)
avgMPG_cyl8