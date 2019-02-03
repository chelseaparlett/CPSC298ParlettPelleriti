#MORE on VECTORS-----------------------------------
1:10
seq(1,10, length = 10)
seq(1,10, by = 2)
rep(10,100)
seqs <- rep(1:10,10)

any(seqs > 5)
all(seqs > 5)

#we Hate John
our_names <- c("Chelsea", "John", "Jim", "Bianca", "Amy", "John", "Jake", "Tony", "Sam")
ifelse(our_names == "John", "J-Money", our_names)
which(our_names == "John")
our_names == "John"
our_names[our_names == "John"]

#LISTS--------------------------------------------
#sorta like a C struct
list2 <- list("name" = "Chelsea", "height" = 160)
class(list2)
#sort of like a dict in python
list2$name

list2[1]
class(list2[1])
list2[[1]]
class(list2[[1]])

#MATRIX----------------------------------------------
ident <- matrix(c(1,0,0,0,1,0,0,0,1), ncol = 3, byrow = T)
ident

ident + 1
ident + 1:3 #recycling, note that it's by column

ident[1,2]

ident[1,2] <- 3
ident

#transpose
t(ident)

v <- c(1,2,3)

#matrix multiplication
v %*% ident

#DATAFRAMES-------------------------
#since a matrix is an array, it can't have multiple types.
#But DFs can! they're implemented as lists (structs)
library(datasets)
summary(iris)
class(iris)

head(iris)

d <- data.frame(ident)
names(d) <- c("a","b","c")
d

#creating your own
set.seed(42)
height <- rnorm(10,mean = 170, sd = 20)
weight <- rnorm(10, mean = 150, sd = 20)
head(height)
head(weight)

hw <- data.frame(height = height, weight = weight)
head(hw)
hw$height
newguy <- c(140,100) #data.frame(height = 140, weight = 100)
hw <- rbind(hw,newguy)
hw

age <- rnorm(11, 25, 2)
hw$age <- age
#or
cbind(hw,age)
#FUNCTIONS------------------------------------------
my_function <- function(arg){
  #doSTUFF
  arg + 1
}

#implicitly returns last object, can also use explicit return()
my_function(1)

squares <- function(n){
  return(n**2)
}

squares(2)
squares(4)

weird_squares <- function(n){
  n <- n + 1
  print(paste("n is",n))
  return(squares(n))
}

n <- 3
n
weird_squares(n)
n

default_square <- function(n = 4){
  return(n**2)
}

default_square()

#CLASSES---------------------------------------
histo <- hist(iris$Sepal.Length)
str(histo)
class(histo)

#generic functions
summary(histo)
a <- lm(iris$Sepal.Length~iris$Sepal.Width)
str(a)
summary(a)
summary(iris)


plot(1:10)
plot(a)
plot(iris)


#BTW just to mention...
example(hist)





