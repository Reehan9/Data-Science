# Load the iris dataset
data(iris)

# View the structure of the iris dataset
str(iris)

# Installing Packages
#install.packages("caTools")
#install.packages("randomForest")

# Load required libraries
library(caTools)
library(randomForest)
library(ggplot2)

# Splitting the data into training and test sets
# Using a 70-30 split ratio, ensuring stratified sampling based on the iris species
split <- sample.split(iris, SplitRatio = 0.7)

# Create training and test subsets based on the split
train <- subset(iris, split == TRUE)
test <- subset(iris, split == FALSE)

# Train a Random Forest classifier
# Using all columns except the 5th (Species) as predictors
# The Species column is used as the target variable
classifier_RF <- randomForest(x = train[-5], y = train$Species, ntree = 250)

# Display the Random Forest model details
classifier_RF

# Predict the species for the test set using the trained classifier
y_pred <- predict(classifier_RF, newdata = test[-5])

# Generate a confusion matrix to evaluate the classifier's performance
confusion_mtx <- table(test[, 5], y_pred)
confusion_mtx

# Calculate accuracy
accuracy <- sum(diag(confusion_mtx)) / sum(confusion_mtx)

# Print accuracy
print(accuracy)

# Data Visualizations 
# Visualize the Random Forest model's error rates for each tree added
plot(classifier_RF)

# Display the importance of each feature in predicting the target variable
importance(classifier_RF)

# Plot the variable importance
varImpPlot(classifier_RF)

#Plot for BoxPlot
ggplot(iris,aes(x=Species,y=Sepal.Length))+
  geom_boxplot()+
  geom_jitter(width=0.2,alpha=0.6)+
  labs(title="Box Plot of Sepal Length by Species",x="Species",y="Length")


# Scatter plot for Sepal Length vs. Sepal Width
ggplot(iris) + 
  geom_point(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  labs(title="Scatter Plot of Sepal Length vs. Sepal Width")

# Density plot for Sepal Length
ggplot(iris) + 
  geom_density(aes(x=Sepal.Length, fill=Species), alpha=0.7) +
  labs(title="Density Plot of Sepal Length")
