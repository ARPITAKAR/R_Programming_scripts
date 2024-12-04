library(car)
install.packages(c("dplyr", "lubridate", "stringr","zoo"))
library(dplyr)
library(lubridate)
log(100,2)
!5>2
# Creating a vector using c() 
v=c(1,2,3,4)
seq(5,15,0.7)
t=1:6
t[(t>5) & (t<19)]
x<-5
logical1 <-(x>2)
is.logical(logical1)
x <- 2
if (x == 3) {
  x <- x - 1
} else {
  x <- 2^x
}
print(x)  # Output: 4 (since 2^2 = 4)
for (i in 1:9) {print(i^3)}
# ifelse(test,yes,no)
x<-1:20
ifelse(x<=9,x^2,x^3)
help("while")
i<- -1
while(i<5){
  print(i^2)
  i<-i+2
  if(i>10) break
}
i<--1
#repeat(repeating the commands specified number of times)
repeat{
  print(i^2)
  i<-i+2
  if(i>10)
    break
}
