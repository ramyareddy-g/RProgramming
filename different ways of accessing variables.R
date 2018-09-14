library(dslabs)
data("AdultUCI")
#access relationship variable using accsessor
method1<- AdultUCI$relationship
method1
class(method1)
#using single square bracket. This will subset that particular column from dataframe. 
#So, the result will be in the form of dataframe
method2<- AdultUCI["relationship"]
class(method2)
View(method2)
#using double square brackets
# here, the class of method3 is same as with $. It's factor not changed to dataframe.
# so, using $ and [[]] both yield same result
method3<- AdultUCI[["relationship"]]
class(method3)
View(method3)

