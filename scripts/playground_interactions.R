library(tidyverse)
library(tidymodels)
library(interactions)
library(sandwich)
library(emmeans)
library(ggeffects)

# Set seed for reproducibility
set.seed(123)

# Number of data points
n <- 1000

# Simulate predictor variables
polAff <- factor(sample(c("rep", "dem"), n, replace = TRUE))
ewe <- factor(sample(c("no", "yes"), n, replace = TRUE))
subjAttr <- runif(n, min = 1, max = 5)

# Simulate dependent variable (deltaDuration) with three-way interaction
deltaDuration <- 0.3 * (polAff == "dem") +
  0.2 * (ewe == "yes") +
  0.5 * subjAttr +
  0.3 * (polAff == "dem") * (ewe == "yes") * subjAttr +
  rnorm(n, mean = 0, sd = 0.1)

# Clamp deltaDuration to the range [-1, 1]
deltaDuration <- pmax(pmin(deltaDuration, 1), -1)

# Create data frame
sim_data <- data.frame(polAff, ewe, subjAttr, deltaDuration)

# View the first few rows of the dataset
head(sim_data)

# Fit model
m <- lm(deltaDuration ~ polAff*ewe*subjAttr, data = sim_data)
tidy(m)

# Probe interactions using package interactions
probe_interaction(m, pred = subjAttr, modx = polAff, mod2 = ewe, alpha = .1)

# Probe interactions using package emmeans
# Simple slopes of polAff by ewe at different levels of subjAttr
emm <- emmeans(m, ~ polAff * ewe | subjAttr, at = list(subjAttr = c(1, 5)))
emm

# Probe interactions using package ggpredict
pred <- predict_response(m, c("polAff", "ewe", "subjAttr[meansd]"))
plot(pred)
test_preds <- test_predictions(pred, test = NULL)
test_preds_minusSD <- test_predictions(pred, test = "(b3 - b4) = (b1 - b2)")
test_preds_mean <- test_predictions(pred, test = "(b7 - b8) = (b5 - b6)")
test_preds_mean <- test_predictions(pred, test = "(b11 - b12) = (b9 - b10)")


# Note: To get johnson-neyman plots as excpected, the first and the last term in
# the terms argument of predict_resopnse need to be numveric. Therefore, we 
# recode polAff as numeric variable.
m_numeric <- lm(deltaDuration ~ as.numeric(polAff)*ewe*subjAttr, data = sim_data)
pred_numeric <- predict_response(m_numeric, c("polAff", "ewe", "subjAttr[meansd]"))
test_preds_numeric <- test_predictions(pred, test = NULL)
jn <- johnson_neyman(pred_numeric)
plot(jn)


