#BIVARIATE EDA FOR DIAMONDS

# the first task is to create a
# scatterplot of price vs x.
# using the ggplot syntax.

ggplot(aes(x= x, y= price), data = diamonds)+
  geom_point()

cor(diamonds$x, diamonds$price)

cor(diamonds$y, diamonds$price)

cor(diamonds$z, diamonds$price)

#price vs depth
ggplot(aes(x= depth, y= price), data = diamonds)+
  geom_point(alpha= 1/8)

cor(diamonds$depth, diamonds$price)

#Create a scatterplot of price vs carat
# and omit the top 1% of price and carat
# values.

ggplot(aes(y= price-(price*0.01), x= carat-(carat*0.01)), data= diamonds)+
  geom_point()


range(diamonds$price)


# creating new variable volume to the diamonds data frame

volume<- diamonds$x*diamonds$y*diamonds$z
diamonds$volume<- volume

#scatterplot price vs volume
ggplot(aes(x= volume, y= price), data= diamonds)+
  geom_point()

cor(diamonds$price, diamonds$volume)

a<-  subset(diamonds$volume<800, data= diamonds)
a
a<-subset(diamonds, select = volume>0 & volume <800)
cor(a$price, a$volume)
b<- diamonds %>% select(volume, price) %>% filter(volume>0 & volume<800)
range(b$volume)
cor(b$price, b$volume)
#Subset the data to exclude diamonds with a volume
# greater than or equal to 800. Also, exclude diamonds
# with a volume of 0. Adjust the transparency of the
# points and add a linear model to the plot.

ggplot(aes(x= volume, y= price), data = b)+
  geom_point(alpha=1/8)+
  #scale_x_continuous(limits = c(1, 799), breaks = seq(1,799, 100))+
  stat_smooth(method = "lm", formula = y ~ x, size = 1)
range(a$volume)
which.max(a$volume)

# Use the function dplyr package
# to create a new data frame containing
# info on diamonds by clarity.

# Name the data frame diamondsByClarity

# The data frame should contain the following
# variables in this order.

#       (1) mean_price
#       (2) median_price
#       (3) min_price
#       (4) max_price
#       (5) n

# where n is the number of diamonds in each
# level of clarity.


diamondsByClarity<- diamonds %>% group_by(clarity)  %>% 
  summarise(mean_price= mean(price),
            median_price= median(price),
            min_price= min(price),
            max_price= max(price),
            n= n())

diamondsByClarity

#created summary data frames with the mean price
# by clarity and color. You can run the code in R to
# verify what data is in the variables diamonds_mp_by_clarity
# and diamonds_mp_by_color.
# writing additional code to create two bar plots
# on one output image using the grid.arrange() function from the package
# gridExtra.

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))


g1<- ggplot(aes(x= clarity, fill= clarity), data = diamonds_mp_by_clarity)+
  geom_bar()
g1

g2<- ggplot(aes(x= color, fill= color), data = diamonds_mp_by_color)+
  geom_bar()
g2

grid.arrange(g1, g2, nrow= 2)



