# Let's now convert tariff_plan and status from (1 = 0, 2 = 1)
customer <- customer %>%
  mutate(
    tariff_plan = ifelse(tariff_plan == 1, 0, 1),
    status = ifelse(status == 1, 0, 1)
  )
# Read the updated cells
head(customer[, c("tariff_plan", "status")])
