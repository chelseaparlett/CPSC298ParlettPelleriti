#libraries-----------------------------------
#https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdfs
library(MASS)
library(ggplot2)
#titles--------------------------------------
ggplot(mtcars, aes(mpg,wt)) + geom_point() +
  ggtitle("CARS I GUESS")

ggplot(mtcars, aes(mpg,wt)) + geom_point() +
  labs(title = "CARS I GUESS")

ggplot(mtcars, aes(mpg,wt)) + geom_point() +
  labs(title = "CARS I GUESS", x = "Miles Per Gallon",
       y = "WEIGHT")

ggplot(mtcars, aes(mpg,wt)) + geom_point() +
  labs(title = "CARS I GUESS", x = "Miles Per Gallon",
       y = "WEIGHT") +geom_smooth(method = lm)

#multiple geoms---------------------------------
a <- mvrnorm(100, c(10,150), matrix(c(2,0.7,0.7,40), ncol = 2))
a <- data.frame(a)
diet <- c(rep("keto",30), rep("vegan",30), rep("omni",40))
a$diet <- diet
sex <- sample(rep(c("Male","Female"),50))
a$sex <- sex
names(a) <- c("Veg", "Weight", "Diet", "Sex")

gg <- ggplot(a,aes(a$Veg,a$Weight))
gg + geom_point() + geom_smooth(method =  lm)

#stacked bar---------------------------------------

gg2 <- ggplot(a,aes(x = Sex)) +
  geom_bar(aes(fill = Diet))

gg2

#facet--------------------------------------------
gg3 <- ggplot(a,aes(Veg,Weight)) + geom_point(aes(color = Diet))
gg3

gg3 + facet_wrap(~Sex)

gg3 + facet_wrap(~Sex) + geom_smooth(method = lm) 

gg3 + facet_wrap(~Sex) + geom_smooth(method = lm) +
  theme_minimal()

gg3 + facet_wrap(~Diet) + geom_smooth(method = lm)

gg3 + coord_flip()

