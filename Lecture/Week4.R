#libraries------------------------------------------------
library(datasets)
library(boot)
#---------------------------------------------------------
#TOOTHGROWTH
#---------------------------------------------------------
#preliminary exploration----------------------------------
head(ToothGrowth)
summary(ToothGrowth)
# you can kinda tell from summary what type the variables are
# (continuous/numeric, discrete/factors), but just to check...
str(ToothGrowth)
aggregate(ToothGrowth[,c("len","dose")],
          FUN = mean, by = list(acid = ToothGrowth$supp))


#graphing---------------------------------------------------
hist(ToothGrowth$len, xlab = "Cell Length",
     ylab = "Count", main = "HISTOGRAM OF CELL LENGTH")

hist(ToothGrowth[ToothGrowth$supp == "OJ", "len"],
     xlab = "Cell Length", ylab = "Count",
     main = "HISTOGRAM OF CELL LENGTH")

hist(ToothGrowth[ToothGrowth$supp == "VC", "len"],
     xlab = "Cell Length", ylab = "Count",
     main = "HISTOGRAM OF CELL LENGTH")

#lets split to make things easier...
str(ToothGrowth)
ToothGrowth$dose <- factor(ToothGrowth$dose)


doseSplit <- split(ToothGrowth, ToothGrowth$dose)
lapply(doseSplit, FUN = function(x) hist(x$len, main = x$dose[1], xlim = c(0,40)))

tble <- aggregate(ToothGrowth[,"len"], FUN = mean,
          by = list(acid = ToothGrowth$supp,
                    dose = ToothGrowth$dose))

dOJ <- tble[tble$acid == "OJ","dose"]
dVC <- tble[tble$acid == "VC","dose"]

meanOJ <- tble[tble$acid == "OJ","x"]
meanVC <- tble[tble$acid == "VC","x"]

plot(levels(dVC), meanVC, type = "o", col = "red")  #factors will default to barplots box and whiskers
lines(levels(dOJ), meanOJ, type = "o", col = "blue")

#barplots
barplot(1:10)
barplot(meanOJ)
barplot(meanVC)
barplot(c(meanOJ,meanVC),
        names = c("0.5 OJ", "1 OJ", "2 OJ", "0.5 VC", "1 VC", "2 VC"),
        col = c(rep("red",3), rep("blue", 3)))


#---------------------------------------------------------
#Melanoma
#https://stat.ethz.ch/R-manual/R-devel/library/boot/html/melanoma.html
#---------------------------------------------------------
#preliminary exploration----------------------------------
head(melanoma)
summary(melanoma)

#Where to start first???
#graphing-------------------------------------------------
plot(melanoma$thickness, melanoma$time)

hist(melanoma$time)
hist(melanoma[melanoma$ulcer == 1, "time"]) #how to make titles pretty?
hist(melanoma[melanoma$ulcer == 0, "time"]) #how to make xaxes the same?


ulcerStatus <- aggregate(melanoma$ulcer, FUN = mean, by = list(ulcers = melanoma$status))
barplot(ulcerStatus$x, names = paste("STATUS",ulcerStatus$ulcers))
barplot(ulcerStatus$x, names = c("Dead Mel", "Alive", "Dead Other")) #can use own names

#What else would you want to do?
