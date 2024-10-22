
# Read Data from mobility.csv

mobility_data <- read.csv('mobility.csv', sep = ';', row.names = 1)
mobility <- as.matrix(mobility_data, byrow= FALSE)

# Add and Use Matrix package
library(Matrix)

sparse_mobility <- Matrix(data = mobility, sparse = TRUE)

# Comparing size of mobility and sparse_mobility

dence_size <- object.size(mobility); dence_size
spare_size <- object.size(sparse_mobility); spare_size