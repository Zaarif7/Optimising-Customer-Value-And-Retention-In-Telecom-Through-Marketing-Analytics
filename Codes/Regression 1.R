# Load Packages
install.packages('gridExtra')
library(gridExtra)
install.packages('emmeans')
library(emmeans)

# Plot the regression chart for Seconds of Use VS Customer Value
ggplot(customer, aes(y = customer_value, x = seconds_of_use)) +
  geom_point() +
  geom_smooth() +
  labs(x = "Seconds of Use", y = "Customer Value") +
  ggtitle("Customer Value vs Seconds of Use")

# Plot the regression chart for Subscription Length VS Customer Value
ggplot(customer, aes(y = customer_value, x = subscription_length)) +
  geom_point() +
  geom_smooth() +
  labs(x = "Subscription Length", y = "Customer Value") +
  ggtitle("Customer Value vs Subscription Length")

# Plot the regression chart for Frequency of SMS VS Customer Value
ggplot(customer, aes(y = customer_value, x = frequency_of_sms)) +
  geom_point() +
  geom_smooth() +
  labs(x = "Frequency of SMS", y = "Customer Value") +
  ggtitle("Customer Value vs Frequency of SMS")

# Model the regression line
model1.reg <- lm(customer_value ~ seconds_of_use, data = customer)
summary(model1.reg)

model1.reg <- lm(customer_value ~ subscription_length, data = customer)
summary(model1.reg)

model1.reg <- lm(customer_value ~ frequency_of_sms, data = customer)
summary(model1.reg)

model1.reg <- lm(customer_value ~ seconds_of_use + subscription_length + frequency_of_sms, data = customer)
summary(model1.reg)

cbind(coef(model1.reg), confint(model1.reg))

# Create quantile-based bins for the two variables used for coloring
seconds_use.bins <- quantile(pull(customer, seconds_of_use))
customer <- customer %>%
  mutate(seconds_use.bin = cut(seconds_of_use, seconds_use.bins, include.lowest = TRUE))

sms_freq.bins <- quantile(pull(customer, frequency_of_sms))
customer <- customer %>%
  mutate(sms_freq.bin = cut(frequency_of_sms, sms_freq.bins, include.lowest = TRUE))

# Plot 1: Seconds of Use vs Customer Value
ggplot(customer, aes(x = seconds_of_use, y = customer_value, col = sms_freq.bin)) +
  geom_point() +
  geom_smooth(method = lm) +
  geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Seconds of Use", y = "Customer Value", col = "Frequency of SMS") +
  ggtitle("Customer Value vs Seconds of Use")

# Plot 2: Frequency of SMS vs Customer Value
ggplot(customer, aes(x = frequency_of_sms, y = customer_value, col = seconds_use.bin)) +
  geom_point() +
  geom_smooth(method = lm) +
  geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Frequency of SMS", y = "Customer Value", col = "Seconds of Use") +
  ggtitle("Customer Value vs Frequency of SMS")
