#week1--------------------------------
print("Hello World")

getwd()
setwd("/Users/chelseaparlett/Desktop")

install.packages("ggplot2")
library(ggplot2)

library(datasets)

summary(iris)
View(iris)

plot(iris$Sepal.Length)
hist(iris$Sepal.Length)

plot(iris$Sepal.Length,iris$Sepal.Width)

iris[1:10,"Sepal.Length"]
iris$Sepal.Length
#Week 2----------------------------------
num = 7
num <- 7
num

name <- "Chelsea"
length(name)
class(num)
class(name)

"Chelsea"*10

ones <- c(1,1,1,1,1,1)
ones

ones[1]
v <- c(1,2,3,4)

v[3]

v <- c(1,"chelsea")
v

a <- list(name = "Chelsea", height = 62)

mat <- matrix(c(1,0,0,0,1,0,0,0,1), ncol = 3)
mat[1,2]
