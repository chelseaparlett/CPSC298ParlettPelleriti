#SIGN UP FOR YOUR PRESENTATIONS-------------------------------------
#https://docs.google.com/spreadsheets/d/18OnC0pZ9lnQRWaGBDE-HDHTP53ObcluLRqelCub09mQ/edit?usp=sharing
#libraries----------------------------------------------------------
library(ggplot2)
#admin--------------------------------------------------------------
set.seed(100)
mtcarsNULL <- data.frame(mpg = c(replicate(12,rnorm(dim(mtcars)[1],mean(mtcars$mpg),sd(mtcars$mpg)))),
                         wt = c(replicate(12,rnorm(dim(mtcars)[1],mean(mtcars$wt),sd(mtcars$wt)))),
                         sim = factor(sort(rep(1:12,dim(mtcars)[1]))))
m <- lm(mpg~wt,data = mtcars)
k <- predict(m)
mtcars$pred <- k
set.seed(123)
GPAs <- round(runif(100,0,4),2)
sex <- rep(c("M","F"), 50)
grade <- factor(sort(rep(c(9:12),25)))

G <- data.frame(GPA = GPAs, sex = sex, grade = grade)
G[G$grade == "12", "GPA"] <- G[G$grade == "12", "GPA"] + 1
G[G$GPA > 4, "GPA"] <- 4
G[G$grade == "9", "GPA"] <- G[G$grade == "9", "GPA"] - 0.7
G[G$GPA <0, "GPA"] <- 0


#regression---------------------------------------------------------
# two continuous variables
mpgWT <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() + theme_minimal()
mpgWT
mpgWT + geom_smooth(method = "lm", se = F)


# data from random simulation, NO RELATIONSHIP
mpgWTNOTHIN <- ggplot(mtcarsNULL, aes(x = wt, y = mpg)) + geom_point() + theme_minimal()
mpgWTNOTHIN + geom_smooth(method = "lm", se = F) + facet_wrap(~sim)

# so how do we tell if ours is just random or not?
# ask: is our line of best fit BETTER than just the mean?

mpgWT + geom_smooth(method = "lm", se = F) +
  geom_hline(yintercept = mean(mtcars$mpg), lty = 2)

#---total---------------------------------------------
mpgWT +
  geom_hline(yintercept = mean(mtcars$mpg), lty = 2) +
  geom_segment(x = mtcars$wt,
               y = rep(mean(mtcars$mpg),32),
               xend = mtcars$wt,
               yend = mtcars$mpg)
#---regression-----------------------------------------
mpgWT + geom_smooth(method = "lm", se = F) +
  geom_hline(yintercept = mean(mtcars$mpg), lty = 2) +
  geom_segment(x = mtcars$wt,
               y = rep(mean(mtcars$mpg),32),
               xend = mtcars$wt,
               yend = mtcars$pred)
#---error----------------------------------------------
mpgWT + geom_smooth(method = "lm", se = F) +
  geom_hline(yintercept = mean(mtcars$mpg), lty = 2) +
  geom_segment(x = mtcars$wt,
               y = mtcars$mpg,
               xend = mtcars$wt,
               yend = mtcars$pred)

#F or t (F = t^2) compares regression to error!

mod <- lm(mpg~wt, data = mtcars)
summary(mod)
anova(mod) #see? SQUARED!


#multiple factors---------------------------------------
mod2 <- lm(mpg~wt + disp, data = mtcars)
summary(mod2)

#same with ANOVA
head(G)
mod3 <- aov(GPA ~ sex + grade, data = G)
summary(mod3)
