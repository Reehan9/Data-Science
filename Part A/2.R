# Install the required packages for association rule mining and visualization
install.packages("arules")
install.packages("arulesViz")

# Load the necessary libraries
library(arules)
library(arulesViz)

#If importing seprating from local system then 
# trans <- read.transactions("/Users/syedreehan/Desktop/a.txt", format = "basket", sep = " ")


# Load the Groceries dataset from the arules package
data(Groceries) 

# Assign the Groceries dataset to the variable 'd'
d <- Groceries


# Generate association rules from 'd' with specified support, confidence, and maximum length
rules <- apriori(d, parameter = list(support = 0.04, confidence = 0.1, maxlen = 4))

# Calculate the frequency of each item in the dataset 'd'
itemfreq <- itemFrequency(d)

# Summarize the item frequencies
summary(itemfreq)


# Summarize the generated association rules
summary(rules)

# Plot the top 10 items by frequency from the rules
itemFrequencyPlot(d, topN = 10)

# Visualize the association rules
plot(rules , color = "green4")
