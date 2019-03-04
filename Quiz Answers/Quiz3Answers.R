

# Use ggplot2 (don't forget to load the ggplot2 library!) to
# create a scatterplot of Sepal.Length and Sepal.Width from
# the iris dataset.
# Color and shape of the points should be determined by Species.

library(ggplot2)
ggplot(iris,aes(Sepal.Length, Sepal.Width)) + geom_point(aes(color = Species, shape = Species)) 
