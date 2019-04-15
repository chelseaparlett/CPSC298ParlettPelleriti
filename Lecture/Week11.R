#SUPERVISED ML----------------------------------------------
#library----------------------------------------------------
library(ggplot2)
library(class)
#admin------------------------------------------------------
# n = 20
n = 100
set.seed(1239)
corgis.weight <- round(rnorm(n,28,2),2)
corgis.height <- round(rnorm(n,56,3),2)

huskies.weight <- round(rnorm(n,22,3),2)
huskies.height <- round(rnorm(n,53,3),2)

corgis <- data.frame(height = corgis.height, weight = corgis.weight, gold = TRUE, plotCol = "red")
huskies <- data.frame(height = huskies.height, weight = huskies.weight, gold = FALSE, plotCol = "black")

dogs <- rbind(corgis, huskies)
#LOGREG-----------------------------------------------------

#predict the probability of being a golden retriever/corgi
#actually we predict the log of the odds.
# log(odds) ~ x + y

ggplot(dogs,aes(x = height, y = weight, color = gold)) +
  geom_point()

set.seed(101) 
sample <- sample.int(n = nrow(dogs),
                     size = floor(.75*nrow(dogs)),
                     replace = F)
train <- dogs[sample, ]
test  <- dogs[-sample, ]


#lm(height~weight, data = dogs)
lr <- glm(gold ~ weight + height, data = train,
          family = "binomial")
lrS <- summary(lr)
lrS

#As height and weight go up, the probability of being a golden retriever goes up


#Confusion Matrix
predict <- predict(lr, test, type = 'response')
table(test$gold, predict > 0.5)

#KNN-------------------------------------------------------
#---dog KNN----------------------------------------------------------
knnGraph <- function(k){
  b = 100
  x <- rep(seq(min(dogs$height), max(dogs$height), length.out = b),b)#mixture.example$x
  y <- sort(rep(seq(min(dogs$weight), max(dogs$weight), length.out = b),b))#mixture.example$y
  xnew <- cbind(x,y)
  x <- dogs[1:2]
  g <- dogs$gold
  #k = 11
  mod15 <- knn(x, xnew, g, k=k, prob=TRUE)
  prob <- attr(mod15, "prob")
  prob <- ifelse(mod15==T, prob, 1-prob)
  px1 <- seq(min(dogs$height), max(dogs$height), length.out = b)
  px2 <- seq(min(dogs$weight), max(dogs$weight), length.out = b)
  prob15 <- matrix(prob, length(px1), length(px2))
  par(mar=rep(2,4))
  contour(px1, px2, prob15, levels=0.5, labels="", xlab="", ylab="", main=
            paste(k,"-nearest neighbour"), axes=FALSE)
  points(x, col=ifelse(g, "coral", "cornflowerblue"))
  gd <- expand.grid(x=px1, y=px2)
  points(gd, pch=".", cex=1.2, col=ifelse(prob15>0.5, "coral", "cornflowerblue"))
  box()
}
knnGraph(1)
knnGraph(5)
knnGraph(11)
knnGraph(15)

#---knn in R-------------------------------------------------
kn <- knn(train[,1:2],test[,1:2],
          cl = train$gold,
          k = 30, prob = T)


table(test$gold,kn)
