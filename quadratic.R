# solve quadratic equation 7X^2+ 5X- 6=0 in R
a<- 7
b<- 5
c<- -6
print((-b + sqrt(b^2-4*a*c)/2*a))
print((-b - sqrt(b^2-4*a*c)/2*a))

# solve 𝑋2 + 3𝑋 + 1 = 0 
A<-1
B<-3
C<-1
solution<- c((-B+sqrt(B^2-4*A*C))/2*A, (-B-sqrt(B^2-4*A*C))/2*A)
solution
