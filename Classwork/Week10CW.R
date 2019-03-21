# Run this code from class a few times, do you always get the same result?
# Why do you think you do/do not always get the same result?
#---YOUR CODE HERE--------------------------------------------------------
cust <- read.csv(file.choose())[,2:3] #choose the RAFishers file
km1 <- kmeans(cust,centers = 3)
cust$cluster <- factor(km1$cluster)
ggplot(cust, aes(x = trips, y = items, color = cluster)) + geom_point() + theme_minimal()

#------------------------------------------------------------------------
# Use hierarchical clustering to cluster cereals based on carbs, sugar, fat, and protein
# from the UScereal's dataset. Describe the dendrogram, look at the 2 and 3 cluster
# solutions using cutree(). What patterns do you see? Plot sugar by fat (see lines 20-21), 
# and color by two clusters. What do you see?
#---YOUR CODE HERE-------------------------------------------------------
library(MASS)
head(UScereals)

model <- ### run hierarchical here!
  
UScereal$cluster <- cutree(model,2)
ggplot(UScereals,aes(x = sugar, y = fat, color = cluster)) + geom_point()


#------------------------------------------------------------------------