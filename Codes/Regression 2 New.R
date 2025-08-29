# Model the regression line with tariff_plan as independent variable
model2.reg <- lm(customer_value~seconds_of_use + 
                   subscription_length +
                   frequency_of_sms +
                   tariff_plan, data = customer)
summary(model2.reg)

# Model the regression with the interaction
interaction.reg <- lm(customer_value~seconds_of_use + 
                        subscription_length + 
                        frequency_of_sms +
                        tariff_plan +
                        seconds_of_use:tariff_plan +
                        subscription_length:tariff_plan +
                        frequency_of_sms:tariff_plan, data = customer)
summary(interaction.reg)