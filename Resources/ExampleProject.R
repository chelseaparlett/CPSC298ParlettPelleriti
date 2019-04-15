head(mtcars)
summary(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am)
mtcars$vs <- factor(mtcars$vs)
mtcars$gear <- factor(mtcars$gear)
#analyses + viz------------------------------------------
#1
m1 <- lm(wt~mpg,mtcars)
summary(m1)

# there is a statistically significant relationship (p < 0.05) between
# weight and mpg. As wt goes down, mpg goes up. So lighter 
# cars tend to have better mpg which makes sense, since 
# it takes more energy to move large objects.

ggplot(mtcars, aes(x =mpg, y = wt)) + geom_point() +
  geom_smooth(method = "lm")




#2

m2 <- aov(mpg~vs, data = mtcars)
summary(m2)

# there is a significant difference between vs 1 and 0 (p < 0.05). Cars
# with vs 1 tend to have better mpg. If someone wanted a car with
# good mpg, they should choose a straight (rather than v-shaped)
# engine.

ggplot(mtcars, aes(x = vs, y = mpg)) +
  geom_boxplot(aes(fill = vs))




#3
#ggplot(mtcars, aes(x = mpg, y= qsec)) + geom_point()
m3 <- kmeans(mtcars[,c("mpg","qsec")],centers = 2)

mtcars$cluster <- factor(m3$cluster)

ggplot(mtcars,aes(x = mpg, y= qsec, color = cluster)) +
  geom_point()
# using k-means, with k = 2, the data was clustered int
# two groups, one with higher mpg and sligtly higher qsec,
# and one with lower mpg and lower qsec. This makes sense to
# me as a car expert, because the better cars which can have 
# a faster 1/4 mile time, also have good engines. Good engines
# also often lead to better mpg. 




#4
m4 <- glm(am~mpg + cyl + wt, data = mtcars,
          family = "binomial")
summary(m4)

predict <- predict(m4, type = 'response')
table(mtcars$am, predict > 0.5)

#         FALSE TRUE
# FALSE    18   1
# TRUE     2   11
# this model performed relatively well. Using cylinders, weight
# and mpg, the model was able to predict 29 out of 32 cars in
# the dataset correctly. Thats an accuracy of ~90%. To improve
# this model, I might want to add some other variables like
# year manufactured.




#5
t <- xtabs(~vs+am, data = mtcars)
chisq.test(t)

# Having a v-shaped engine(vs) is not significantly related
# to a car being automatic (am) (p > 0.05). Since each engine shape
# can be used with either automatic or manual cars.


ggplot(mtcars, aes(am, fill = vs)) + geom_bar()

ggplot(mtcars, aes(group = am, y = mpg)) +
  geom_boxplot(aes(fill = am)) +
  facet_grid(~vs) + ggtitle("MPG vs AM and VS")

