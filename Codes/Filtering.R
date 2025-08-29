# First I will load the necessary libraries
library(dplyr)
library(tidyverse)

# Let's run the dataset now
dataset <- read.csv("/Users/jawadzaarif7/Desktop/38159/Final/Customer Churn.csv", stringsAsFactors = FALSE)

# Now I will check the number of columns and rows
cat("Number of rows:", nrow(dataset), "\n")
cat("Number of columns:", ncol(dataset), "\n")

# Time to check for duplicate rows
duplicate_count <- sum(duplicated(dataset))
cat("Number of duplicate rows:", duplicate_count, "\n")

# I did find duplicate values, time to check for missing values
missing_values <- colSums(is.na(dataset))
cat("Missing values per column:\n")
print(missing_values)

# Since there were no missing values, lets remove the duplicate rows now
dataset_cleaned <- dataset %>% distinct()

# Let's check the updated number of rows and columns now
cat("After removing duplicates:\n")
cat("Number of rows:", nrow(dataset_cleaned), "\n")
cat("Number of columns:", ncol(dataset_cleaned), "\n")

# Time to confirm if the duplicates were removed or not
duplicate_count_cleaned <- sum(duplicated(dataset_cleaned))
cat("Number of duplicate rows:", duplicate_count_cleaned, "\n")

# Just to be sure, I will again check in case any values turned into null
missing_values_cleaned <- colSums(is.na(dataset_cleaned))
cat("Missing values per column:\n")
print(missing_values_cleaned)
