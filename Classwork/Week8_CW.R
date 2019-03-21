# Load the file IQMedicine.csv into R using this code.
# Then perform an ANOVA to determine whether there's a significant
# effect of medicine on IQ. What does the ANOVA tell you about medicine?
# Plot the IQs of each group using ggplot. RE-use the code from class or geom_boxplot()
#---YOUR CODE HERE-------------------------------------------------
library(ggplot2)
data <- read.csv(file.choose())

#------------------------------------------------------------------
# Load the file GPAs.csv into R using this code.
# Then perform 3 ANOVAs to determine whether there's a significant
# effect of any 3 factors (eye color, gender, race, birth month) on GPA.
# What does the ANOVA tell you about their effect on GPA?
# Plot the GPAs of each group using ggplot. RE-use the code from class or geom_boxplot()
#---YOUR CODE HERE-------------------------------------------------
library(ggplot2)
data2 <- read.csv(file.choose())

#------------------------------------------------------------------