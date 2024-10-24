
# Read Data from mobility.csv

mobility_data <- read.csv('mobility.csv', sep = ';', row.names = 1)
mobility <- as.matrix(mobility_data, byrow= FALSE)

# Question 1
# Add and Use Matrix package
library(Matrix)

sparse_mobility <- Matrix(data = mobility, sparse = TRUE)


# Question 2
# Comparing size of mobility and sparse_mobility

dence_size <- object.size(mobility); dence_size
spare_size <- object.size(sparse_mobility); spare_size

# Question 3
# sparseProp function

sparseProp <- function(x){
  total_elements <- length(x)
  
  total_zero <- sum(x == 1)
  
  proportion <- total_zero / total_elements
  return(proportion)
}

p <- sparseProp(sparse_mobility)
print(p)


# Question 4
# Find Maximums in different indexes!

index_matrix <- matrix(c('Div', 'DIV',
                         'Art', 'ART',
                         'Arm', 'ARM'),
                       nrow = 3, ncol =2, byrow =TRUE)
max_values <- mobility[as.matrix(index_matrix)]
max_values


# Question 5
# Find frequencies of the values in a matrix!

freqOfFreq <- function(x){
  stopifnot("the input of function should be a matrix"=is.matrix(x))
  
  freq_table <- table(x, dnn = NULL)
  return(freq_table)
}

freqOfFreq(mobility)



















