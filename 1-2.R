d=read.csv("covid_location_data.csv", header=TRUE)
d[1,]
fit= lm(d$new_cases ~ d$new_tests) ##linear regression model with tests predicting cases
summary(fit) ##                     Ignore Blanks 
cor(d$new_cases, d$new_tests, use = "complete.obs")  ##correlation between cases and tests is .865
options(scipen=999) ##remove scientific notation

fit2= lm(d$new_deaths ~ d$new_cases + d$new_cases_smoothed + d$new_cases_smoothed_per_million)
summary(fit2) ##                       Ignore Blanks
cor(d$new_deaths, d$new_cases, use = "complete.obs") ##correlation between new deaths and new cases is .92
##new cases, new cases smoothed and new cases smoothed per million are all statistically significant

