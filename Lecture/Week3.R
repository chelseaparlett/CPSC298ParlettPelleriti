#Loops In R...grudgingly.
#if-----------------------------------------
if (1 == 1){
  a <- TRUE
} else {
  a <- FALSE
}

#else if
b <- 11
if (b%%2 == 0){
  print("even")
} else if (b%%3 == 0){
  print("divisible by 3")
} else {
  print("crappy number")
}


#while----------------------------------------
x <- 2
while (x < 5){
  print("hello")
  x <- x + 1
}

#error...
x <- c(1,2,3,4,5,6)
while(x < 0){
  print("hello")
}


#for-----------------------------------------
#what do you think this will output?
for (i in 1:10){
  print(paste0(rep("!",i)))
}
#That being said, try not to use loops when you can use
#VECTORIZATION

i <- 1:20
j <- rep(NA,length(i))

#instead of...
for (n in i){
  j[i] <- i*11
}

#try...
j <- i*11

#instead of...
letters <- c("a","b", "c","d","e","f","g","h","i","j","k")
vowLets <- c()
vowels <- c("a","e","i","o","u")


for (let in letters){
  if (let %in% vowels){
    vowLets <- c(vowLets,TRUE) #WARNING: memory inefficient
  } else {
    vowLets <- c(vowLets, FALSE) #WARNING: memory inefficient
  }
}

#try...
vowLets2 <- ifelse(letters %in% vowels, TRUE, FALSE)

#--------------------------------------------
#Apply Family
#--------------------------------------------
#https://www.datacamp.com/community/tutorials/r-tutorial-apply-family
#apply()-------------------------------------
mat <- matrix(c(1,2,3,4,7,4,2,5,7), nrow = 3)
apply(mat,2,mean)

#works with UDFs
my_fun <- function(column){
  return(max(column))
}

apply(mat,2,my_fun)

#lapply()-----------------------------------
#QUICK REVIEW: normal distribution
#for lists (and btw dfs are lists)
age <- round(rnorm(10,40,10)) #years
height <- round(rnorm(10,140,20)) #cm?
weight <- round(rnorm(10,170,35)) #lbs

people <- data.frame(age = age, height = height, weight = weight)
head(people)

lapply(people,mean) #note, returns a LIST

peopleMAT <- as.matrix(people)
peopleMAT

apply(peopleMAT,2,mean) #not a list!

#note lists can hold complex data types...
age2 <- round(rnorm(100,40,10)) #years
height2 <- round(rnorm(100,140,20)) #cm?
weight2 <- round(rnorm(100,170,35)) #lbs
group <- sort(rep(1:10,10))

d <- data.frame(age = age2, height = height2, weight = weight2, split = group)
dSplit <- split(d,d$split)
str(dSplit)

lapply(dSplit,function(x) cor(x$age,x$height))

#sapply()------------------------------------
sapply(dSplit,function(x) cor(x$age,x$height))
#mapply()------------------------------------
mapply(paste,c("Chelsea", "Tony", "Sam"),
       c("Parlett", "Pelleriti","Jones"))

#aggregate-----------------------------------
aggregate(iris[,1:4], FUN = mean, by = list(species = iris$Species))
