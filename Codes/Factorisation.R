# I will first run the necessary libraries
library(dplyr)
library(readr)
library(tidyverse)

# Since I saved the updated dataset, let's run the updated dataset now
customer <- read_csv("/Users/jawadzaarif7/Desktop/38159/Final/Customer_Churn_Cleaned.csv")

# I will now factorise the categorical features
customer <- customer %>%
  mutate(
    complains = as.factor(complains),
    churn = as.factor(churn),
    age_group = as.factor(age_group),
    tariff_plan = as.factor(tariff_plan),
    status = as.factor(status)
  )

# Done! Let's confirm the changes now
str(customer)

# Summary of factor distributions
summary(customer[, c("complains", "churn", "age_group", "tariff_plan", "status")])
