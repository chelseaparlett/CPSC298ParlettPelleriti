# CLUSTERING
#libraries---------------------------------------------------
library(cluster) 
library(mclust)  
library(tidyverse)
library(MASS)
library(vcd)
#CHISQ Real Quick--------------------------------------------
head(Arthritis)
plot(Arthritis[,c("Treatment","Improved")])
xt <- xtabs(~ Treatment + Improved, Arthritis)
xt

chisq.test(xt)
#admin-------------------------------------------------------
x <- data.frame(x = rnorm(100,100,20), y = rnorm(100,100,20))
#KMEANS------------------------------------------------------
cust <- read.csv(file.choose())[,2:3]
head(cust)

#how many groups do you think there are? 2? 3? 4?
plot(cust)

#---choose random centers------------------------------------
set.seed(123)
pts <- round(runif(3,1,dim(cust)[1]),0)
c1.x <- cust[pts[1],"trips"]
c2.x <- cust[pts[2],"trips"]
c3.x <- cust[pts[3],"trips"]
c1.y <- cust[pts[1],"items"]
c2.y <- cust[pts[2],"items"]
c3.y <- cust[pts[3],"items"]
df <- data.frame(trips = c(c1.x,c2.x,c3.x), items = c(c1.y,c2.y,c3.y))
cust2 <- cust
custJMP <- cust

#plot
j <- c(c1.x,c2.x,c3.x,c1.y,c2.y,c3.y)
j <- list(j = j, clusters = c())
plot(cust2$trips, cust2$items, xlab = "Average # of Trips", ylab = "Average Items per Purchase")
points(c(c1.x,c2.x,c3.x), c(c1.y,c2.y,c3.y), col = c("purple", "blue", "green"), pch = "+", cex = 3)

#---iterate--------------------------------------------------                  
kmonce <- function(cs) {
  xs <- c()
  for (po in 1:dim(cust)[1]){
    xx <- cust[po,]$trips
    yy <- cust[po,]$items
    a <- sqrt(((xx-cs[1])**2)+((yy-cs[4])**2))
    b <- sqrt(((xx-cs[2])**2)+((yy-cs[5])**2))
    c <- sqrt(((xx-cs[3])**2)+((yy-cs[6])**2))
    k <- min(c(a,c,b))
    if (k == a){
      xs <- c(xs,"purple")
    }
    if (k == b){
      xs <- c(xs,"blue")
    }
    if (k == c){
      xs <- c(xs,"green")
    }
    
  }
  plot(cust$trips, cust$items, xlab = "Average # of Trips",
       ylab = "Average Items per Purchase", col = xs)
  points(c(cs[1], cs[2], cs[3]), c(cs[4], cs[5], cs[6]), col = c("purple", "blue", "green"), pch = "+", cex = 3)
  c1.x <- mean(cust[xs == "purple","trips"])
  c2.x <- mean(cust[xs == "blue","trips"])
  c3.x <- mean(cust[xs == "green","trips"])
  
  c1.y <- mean(cust[xs == "purple","items"])
  c2.y <- mean(cust[xs == "blue","items"])
  c3.y <- mean(cust[xs == "green","items"])
  plot(cust$trips, cust$items, xlab = "Average # of Trips",
       ylab = "Average Items per Purchase", col = xs)
  points(c(c1.x,c2.x,c3.x), c(c1.y,c2.y,c3.y),
         col = c("purple", "blue", "green"), pch = "+", cex = 3)
  return(list(j = c(c1.x,c2.x,c3.x,c1.y,c2.y,c3.y), clusters = xs))
}           


centers <- list(j$j)
j <- kmonce(j$j)



#---using R -------------------------------------------------
km1 <- kmeans(cust,centers = 3)
cust$cluster <- factor(km1$cluster)
ggplot(cust, aes(x = trips, y = items, color = cluster)) + geom_point() + theme_minimal()

km2 <- kmeans(iris[1:2],centers = 3)
iris$cluster <- factor(km2$cluster)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = cluster, shape = Species)) + 
  geom_point() + theme_minimal()

km3 <- kmeans(iris[1:4], centers = 3)
iris$cluster <- factor(km3$cluster)

d <- count(iris, cluster, Species)
d


#Hierarchical------------------------------------------------
hierarchical <- hclust(dist(iris[1:4]))
plot(hierarchical,labels = F)
three <- cutree(hierarchical,3)

iris$Hclust3 <- factor(three)
dH <- count(iris, Hclust3, Species)
dH
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Hclust3, shape = Species)) +
  geom_point()

two <- cutree(hierarchical,2)

iris$Hclust2 <- factor(two)
dH <- count(iris, Hclust2, Species)
dH

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Hclust2, shape = Species)) +
  geom_point()


#---other dendros------------------------------------------
plot(x)
h <- hclust(dist(x))
plot(h, labels = F)
plot(hierarchical,labels = F)

#notice the difference in densities?