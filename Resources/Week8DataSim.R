IQ <- rnorm(100,100,15)
meds <- rep(c("A","B","C","D"),25)
IQmeds <- data.frame(IQ = IQ, Medicine = meds)

IQmeds[IQmeds$Medicine =="A","IQ"] <- IQmeds[IQmeds$Medicine =="A","IQ"] + 5
IQmeds[IQmeds$Medicine =="B","IQ"] <- IQmeds[IQmeds$Medicine =="B","IQ"] -5
IQmeds[IQmeds$Medicine =="C","IQ"] <- IQmeds[IQmeds$Medicine =="C","IQ"] +10
write.csv(IQmeds,"IQMedicine.csv")

summary(aov(IQ ~ Medicine, data = IQmeds))

# Load the file GPAs.csv into R using this code.
# Then perform 3 ANOVAs to determine whether there's a significant
# effect of any 3 factors (eye color, gender, race, birth month) on GPA.

GPA <- round(runif(1000,0,4),2)
race <- factor(rep(c(1,2,3,4,5),200))
gender <- factor(rep(c(1,2),500))
eyecolor <- rep(c("blue","green","brown","brown"),250)
birthmonth <- rep(c("Jan",
                    "Feb",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                    "Sep",
                    "Oct",
                    "Nov",
                    "Dec"),84)
birthmonth <- birthmonth[1:1000]

d2 <- data.frame(GPA =GPA,
                 race = race,
                 gender = gender,
                 eyecolor = eyecolor,
                 birthmonth = birthmonth)

write.csv(d2,"GPAs.csv")

summary(aov(GPA ~ race, data = d2))
summary(aov(GPA ~ eyecolor, data = d2))
summary(aov(GPA ~ gender, data = d2))
summary(aov(GPA ~ birthmonth, data = d2))