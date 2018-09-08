mexican_food<- c('burritos', 'quesidillas', 'enchilladas', 'tortillas')
quantity<- c('four', 'five', 'eight','six')
days<- c('monday', 'tuesday','wednesday', 'thursday')
x=names(mexican_food)<- quantity
x
y=names(mexican_food)<- days
mexican_food
y
final<- sum(mexican_food)+sum(quantity)+sum(days)
final