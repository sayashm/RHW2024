
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

# Question 6

# meamFOF function: A function designed to compute the mean frequency of a matrix.

meanFOF <- function(freq_table){
  freq_values <- as.numeric(names(freq_table))
  
  mean_value <- sum(freq_values * freq_table) / sum(freq_table)
  return(mean_value)
}

# varFOF function: A function designed to compute the variance frequency of a matrix.
varFOF <- function(freq_table){
  freq_values <- as.numeric(names(freq_table))
  # Calculate the mean of freq_table:
  mean_value <- meanFOF(freq_table)
  
  # Calculate the variance of freq_value
  variance <- sum((freq_values - mean_value)^2 * freq_table) / (sum(freq_table)-1)

  
  return(variance)
}

mean_fof <- meanFOF(freqOfFreq(mobility))

var_fof <- varFOF(freqOfFreq(mobility))













