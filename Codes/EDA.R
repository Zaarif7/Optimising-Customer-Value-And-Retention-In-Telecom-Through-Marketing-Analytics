# I will now load the psych library for descriptive statistics
library(psych)

# Let's do the descriptive statistics for the numerical features
numeric_summary <- psych::describe(select(customer, where(is.numeric)))
print(numeric_summary)

# Frequency tables for factor variables
cat("\nFrequency tables for categorical variables:\n")

categorical_vars <- c("complains", "churn", "age_group", "tariff_plan", "status")

for (var in categorical_vars) {
  cat("\n", var, ":\n")
  print(table(customer[[var]]))
}

# Time to do the visualisations for numerical and categorical variables!
library(tidyverse)
library(corrplot)
library(ggplot2)
library(dplyr)
library(tidyr)

# Boxplot: Call Failures
boxplot(customer$call._failure,
        xlab = "Number of Call Failures",
        main = "Boxplot: Call Failures",
        horizontal = TRUE)

# Boxplot: Subscription Length
boxplot(customer$subscription_length,
        xlab = "Subscription Length (Months)",
        main = "Boxplot: Subscription Length",
        horizontal = TRUE)

# Boxplot: Charge Amount
boxplot(customer$charge_amount,
        xlab = "Monthly Charge Amount",
        main = "Boxplot: Charge Amount",
        horizontal = TRUE)

# Boxplot: Seconds of Use
boxplot(customer$seconds_of_use,
        xlab = "Seconds of Use",
        main = "Boxplot: Seconds of Use",
        horizontal = TRUE)

# Boxplot: Frequency of Use
boxplot(customer$frequency_of_use,
        xlab = "Frequency of Use",
        main = "Boxplot: Frequency of Use",
        horizontal = TRUE)

# Boxplot: Frequency of SMS
boxplot(customer$frequency_of_sms,
        xlab = "Frequency of SMS",
        main = "Boxplot: Frequency of SMS",
        horizontal = TRUE)

# Boxplot: Distinct Called Numbers
boxplot(customer$distinct_called_numbers,
        xlab = "Number of Distinct Called Numbers",
        main = "Boxplot: Distinct Called Numbers",
        horizontal = TRUE)

# Boxplot: Customer Value
boxplot(customer$customer_value,
        xlab = "Customer Value",
        main = "Boxplot: Customer Value",
        horizontal = TRUE)

# Histogram: Call Failures
hist(customer$call._failure,
     main = "Histogram: Call Failures",
     xlab = "Number of Call Failures",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Histogram: Subscription Length
hist(customer$subscription_length,
     main = "Histogram: Subscription Length",
     xlab = "Subscription Length (Months)",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Histogram: Charge Amount
hist(customer$charge_amount,
     main = "Histogram: Charge Amount",
     xlab = "Monthly Charge Amount",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Histogram: Seconds of Use
hist(customer$seconds_of_use,
     main = "Histogram: Seconds of Use",
     xlab = "Seconds of Use",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Histogram: Frequency of Use
hist(customer$frequency_of_use,
     main = "Histogram: Frequency of Use",
     xlab = "Frequency of Use",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Histogram: Frequency of SMS
hist(customer$frequency_of_sms,
     main = "Histogram: Frequency of SMS",
     xlab = "Frequency of SMS",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Histogram: Distinct Called Numbers
hist(customer$distinct_called_numbers,
     main = "Histogram: Distinct Called Numbers",
     xlab = "Number of Distinct Called Numbers",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Histogram: Customer Value
hist(customer$customer_value,
     main = "Histogram: Customer Value",
     xlab = "Customer Value",
     ylab = "Frequency",
     breaks = 30,
     col = "lightgreen")

# Pair Plot for Key Numerical Variables
pairs(formula = ~call._failure + subscription_length + charge_amount + seconds_of_use +
        frequency_of_use + frequency_of_sms + distinct_called_numbers + customer_value,
      data = customer,
      cex = 0.15,
      main = "Pair Plot")

# Correlation Matrix and Heatmap
cor_matrix <- cor(customer[, c('call._failure', 'subscription_length', 'charge_amount', 'seconds_of_use',
                               'frequency_of_use', 'frequency_of_sms',
                               'distinct_called_numbers', 'customer_value')],
                  use = "complete.obs")

corrplot(cor_matrix,
         method = 'color',
         addCoef.col = "blue",
         tl.col = "black",
         title = "Correlation Heatmap",
         mar = c(0, 0, 2, 0))  # Add top margin for the title

# Bar Plot: Complains
ggplot(customer, aes(x = complains)) + 
  geom_bar(fill = "yellow") +  
  labs(title = "Bar Plot: Complains",
       x = "Complains (0 = No, 1 = Yes)",
       y = "Frequency") +
  theme_minimal()

# Bar Plot: Churn
ggplot(customer, aes(x = churn)) + 
  geom_bar(fill = "yellow") +  
  labs(title = "Bar Plot: Churn",
       x = "Churn (0 = No, 1 = Yes)",
       y = "Frequency") +
  theme_minimal()

# Bar Plot: Age Group
ggplot(customer, aes(x = age_group)) + 
  geom_bar(fill = "yellow") +  
  labs(title = "Bar Plot: Age Group",
       x = "Age Group",
       y = "Frequency") +
  theme_minimal()

# Bar Plot: Tariff Plan
ggplot(customer, aes(x = tariff_plan)) + 
  geom_bar(fill = "yellow") +  
  labs(title = "Bar Plot: Tariff Plan",
       x = "Tariff Plan (1 = Basic Plan, 2 = Premium Plan)",
       y = "Frequency") +
  theme_minimal()

# Bar Plot: Status
ggplot(customer, aes(x = status)) + 
  geom_bar(fill = "yellow") +  
  labs(title = "Bar Plot: Customer Status",
       x = "Status (1 = Active, 2 = Inactive)",
       y = "Frequency") +
  theme_minimal()
