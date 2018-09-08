fruits<- c('apples', 'oranges', 'grapes','strawberries', 'blueberries')
vegetables<- c('tomatoes', 'carrots', 'broccoli', 'lettuce', 'onion')
salad<- factor(fruits)
food<- factor(fruits)
salad

is.ordered(salad)
is.ordered(food)

sort.default(salad)
sort.default(food)

print(nlevels(salad))
food
print(nlevels(food))
salad         