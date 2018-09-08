chocs<- c("snickers", "lemonade", "cadbury", "kitkat")
cookies<- c("cinnamon", "oatmeal", "chocochip", "raisins")
dessert<- rbind(chocs, cookies)
dessert
str(dessert)
col_names <- c("col1", "col2", "col3","col4")
colnames(dessert)<- col_names
dessert
