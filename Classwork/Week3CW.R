# A very lazy assistant did not do a good job typing out the
# information for this book data frame...use our new apply() family
# to make all the strings lowercase using tolower().
#-----------------------------------------------------------------------------------
#YOUR CODE HERE
book_name <- c("JANE EYRE", "tell tale heart",
               "CHROnICLES of NARNIa","Pride and Prejudice",
               "The IMITATION GAME", "The wizard of quarks",
               "A brief history of NEARLY everything")
author_name <- c("Charlotte BRONTe", "Edgar Allen Poe",
                 "C.S. LEWIS", "Jane Austen",
                 "Andrew Hodges","Robert Gilmore",
                 "BILL BrySOn")
genre <- c("ficTION", "fictiON", "ficTIoN","fiCTion",
           "historical FICTION", "AlleGORY",
           "nonFICTiOn")

books <- data.frame(name = book_name, author = author_name,
                    genre = genre)
#-----------------------------------------------------------------------------------
# Use our new apply() methods to get the mean, median, and min values
# for each column of the mtcars dataset.
# 
# write your own function, gthan(co,g), that takes a vector (or column),
# and a numeric g as arguments. The function should return the number of
# elements in co that are greater than g.
# 
# Use mapply() to call this function on the mtcars data set, you will
# need to create a vector vals, that has an appropriate value for the
# g argument.
#-----------------------------------------------------------------------------------
#YOUR CODE HERE
head(mtcars)


gthan <- function(co,g){
  ###
}
vals <- c()
