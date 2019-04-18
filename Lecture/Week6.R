#libraries-----------------------------------
library(ggplot2)
#plotting------------------------------------
#---scatterplot------------------------------
plot(iris$Sepal.Length,iris$Sepal.Width,
     col = iris$Species)

gg <- ggplot(iris,aes(x = iris$Sepal.Length,
                      y = iris$Sepal.Width,
                color = iris$Species))
gg
#STEP 1: tell ggplot what the data is

gg + geom_point()
#STEP 2: tell ggplot what type of plot you want
#---histogram--------------------------------
bs <- seq(min(iris$Sepal.Length), max(iris$Sepal.Length), length = 30)
hist(iris$Sepal.Length,breaks = bs )

gg2 <- ggplot(iris, aes(x=iris$Sepal.Length))
gg2 + geom_histogram()
#---barplot----------------------------------
gg3 <- ggplot(iris,aes(x = iris$Species))

gg3 + geom_bar()
#---boxplot----------------------------------
gg4 <- ggplot(iris, aes(x = iris$Species,
                        y = iris$Sepal.Length)) +
  geom_boxplot(aes(fill = iris$Species))
gg4

#you can add multiple geoms!
gg4 + geom_point(aes(shape = iris$Species))
gg4 + geom_point()


#themes--------------------------------------
gg4 + theme_linedraw()
gg4 + theme_dark()
gg4 + theme_minimal()
gg4 + theme_classic()

install.packages("ggthemes")
library(ggthemes)

gg4 + theme_wsj() + theme_classic()
