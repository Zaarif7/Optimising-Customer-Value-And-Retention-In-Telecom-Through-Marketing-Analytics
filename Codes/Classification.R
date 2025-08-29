customer <- data.frame(customer)  # Ensure it's a dataframe

# Description and summary
str(customer)
summary(customer)

# Look at the class variable
table(customer$churn)

# Load C50 package
install.packages("C50")
library(C50)


# Build the simplest decision tree
# Exclude customer_id (assumed to be the 1st column)
churn_model <- C5.0(customer[,-c(1,14,15,16)], customer$churn)  # Exclude customer_id and churn from predictors

# Display simple facts about the tree
churn_model

# Display detailed information
summary(churn_model)

# Plot the results 
plot(churn_model)

# Limit the tree size and try again
churn_model2 <- C5.0(customer[,-c(1,14,15,16)], customer$churn,
                    control = C5.0Control(minCases = 100))  # Exclude customer_id and churn from predictors

# Display tree summary
churn_model2
summary(churn_model2)

# Plot the simplified tree
plot(churn_model2)

### END ###
