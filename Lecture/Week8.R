#ANOVA----------------------------------------------------------
#https://www.youtube.com/watch?v=oOuu8IBd-yo
library(ggplot2)
library(datasets)
#---last time...------------------------------------------------
irisVers <- iris[iris$Species == "versicolor", "Sepal.Length"]
irisSet <- iris[iris$Species == "setosa", "Sepal.Length"]

t.test(irisVers,irisSet, var.equal = T)

#what does the p-value tell you?
#---MultipleGroups----------------------------------------------
model <- aov(Sepal.Length ~ Species, data = iris)
summary(model)

ggplot(iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot()

#what does the p-value tell you?

#effect Sizes
spec <- unique(iris$Species)
means <- lapply(spec, function(x) mean(iris[iris$Species == x,"Sepal.Length"]))
names(means) <- spec
means

#---WHATS HAPPENING----------------------------------------------
#------admin-----------------------------------------------------
set.seed(123)
iris$jitter <- rnorm(dim(iris)[1],0,1)
iris[iris$Species == "setosa", "jitter"] <- iris[iris$Species == "setosa", "jitter"] + 8
iris[iris$Species == "versicolor", "jitter"] <- iris[iris$Species == "versicolor", "jitter"] + 4

overallmean = mean(iris$Sepal.Length)
versMean <- mean(iris[iris$Species == "versicolor","Sepal.Length"])
setMean <- mean(iris[iris$Species == "setosa","Sepal.Length"])
virgMean <- mean(iris[iris$Species == "virginica","Sepal.Length"])
mus <- list(setosa = setMean,versicolor = versMean, virginica = virgMean)

iris$groupMean <- as.numeric(mus[iris$Species])
#------overallVar------------------------------------------------
p <- ggplot(iris,aes(x = jitter ,y = Sepal.Length)) +
  geom_point(aes(color = Species)) +
  theme_minimal()
p

p <- p + geom_hline(yintercept = overallmean,lwd = 1.5, lty = 2)
p

p + geom_segment(x = iris$jitter,
                 y = iris$Sepal.Length,
                 xend = iris$jitter,
                 yend = rep(overallmean, 150))

#------groupVar--------------------------------------------------
pG <- ggplot(iris,aes(x = jitter ,y = Sepal.Length)) +
  geom_point(aes(color = Species)) + theme_minimal()
pG +
  geom_segment(x = iris$jitter,
               y = iris$groupMean,
               xend = iris$jitter,
               yend = rep(overallmean,150))+
  geom_segment(x = -2.5,
               y = virgMean,
               xend = 2.5,
               yend = virgMean) +
  geom_segment(x = 2.5,
               y = versMean,
               xend = 6,
               yend = versMean) +
  geom_segment(x = 6,
               y = setMean,
               xend = 11,
               yend = setMean) + 
  geom_hline(yintercept = overallmean,lwd = 1.5, lty = 2) 
#------errorVar---------------------------------------------------
pG + geom_segment(x = iris$jitter,
                  y = iris$Sepal.Length,
                  xend = iris$jitter,
                  yend = iris$groupMean) +
  geom_segment(x = -2.5,
               y = virgMean,
               xend = 2.5,
               yend = virgMean) +
  geom_segment(x = 2.5,
               y = versMean,
               xend = 6,
               yend = versMean) +
  geom_segment(x = 6,
               y = setMean,
               xend = 11,
               yend = setMean) + 
  geom_hline(yintercept = overallmean, lwd = 1.5, lty = 2) 










#------examples of plots (admin)---------------------------------
set.seed(123)
e1A <- rnorm(20,10,20)
e1B <- rnorm(20,15,20)
e1C <- rnorm(20,20,20)

e2A <- rnorm(20,10,1)
e2B <- rnorm(20,15,1)
e2C <- rnorm(20,20,1)

e3A <- rnorm(20,10,5)
e3B <- rnorm(20,15,5)
e3C <- rnorm(20,20,5)

e4A <- rnorm(20,10,10)
e4B <- rnorm(20,15,10)
e4C <- rnorm(20,20,10)

exper <- sort(rep(c(1,2,3,4),60))
group <- sort(rep(c(10,20,30),20))
group <- rep(group,4)
scores <- c(e1A,e1B,e1C,
            e2A,e2B,e2C,
            e3A,e3B,e3C,
            e4A,e4B,e4C)

Es <- data.frame(scores = scores,
                 group = group,
                 Exp = factor(exper))

Es$jitter <- e1$group + rnorm(240,0,2)

ggplot(Es,aes(x = jitter, y = scores, color = group)) +
  geom_point() + theme_minimal() + facet_wrap(~Exp) +
  theme(legend.title = element_blank(), legend.position = "none")

#but if difference is big, even big variances don't matter
set.seed(123)
e1A <- rnorm(20,100,20)
e1B <- rnorm(20,150,20)
e1C <- rnorm(20,200,20)

e2A <- rnorm(20,100,1)
e2B <- rnorm(20,150,1)
e2C <- rnorm(20,200,1)

e3A <- rnorm(20,100,5)
e3B <- rnorm(20,150,5)
e3C <- rnorm(20,200,5)

e4A <- rnorm(20,100,10)
e4B <- rnorm(20,150,10)
e4C <- rnorm(20,200,10)

exper <- sort(rep(c(1,2,3,4),60))
group <- sort(rep(c(10,20,30),20))
group <- rep(group,4)
scores <- c(e1A,e1B,e1C,
            e2A,e2B,e2C,
            e3A,e3B,e3C,
            e4A,e4B,e4C)

Es <- data.frame(scores = scores,
                 group = group,
                 Exp = factor(exper))

Es$jitter <- e1$group + rnorm(240,0,2)

ggplot(Es,aes(x = jitter, y = scores, color = group)) +
  geom_point() + theme_minimal() + facet_wrap(~Exp) +
  theme(legend.title = element_blank(), legend.position = "none")

#------F scores-------------------------------------------------
#F scores compare between group variance
#(how different are the groups)
#to Error Variance
#(how different are members of each group)
# in general when F > 2, p < 0.05

#outcome ~ group
m1 <- aov(Sepal.Length ~ Species, data = iris)
summary(m1)
p

#---More ANOVAs!---------------------------------------------
#Insects
summary(aov(count ~ spray,
            data = InsectSprays))
ggplot(InsectSprays, aes(x = as.numeric(spray), y = count)) +
  geom_point() + labs(title = "INSECT SPRAY", x = "SPRAY") +
  theme(axis.text.x = element_blank())

#
summary(aov(mpg ~ gear,
            data = mtcars))
ggplot(mtcars, aes(x = as.numeric(gear), y = mpg)) +
  geom_point() + labs(title = "GEARS by MPG", x = "Gear") +
  theme(axis.text.x = element_blank())

