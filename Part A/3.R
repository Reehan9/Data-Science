# Load necessary libraries
library(cluster)
library(ggplot2)

# Use the iris dataset and exclude the Species column for clustering
x <- iris[-5]

model <- kmeans(x,centers =  3)

# Use clusplot for visualization
clusplot(x, model$cluster, main="2D representation of the Cluster solution")

# Optionally, plot Sepal.Length vs Sepal.Width with ggplot for comparison
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = cluster)) + 
  geom_point() + 
  labs(title = "K-means Clustering of Iris Dataset with ggplot2")

