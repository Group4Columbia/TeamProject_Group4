d=read.csv("covid_location_data.csv", 
	header=TRUE)
d[1,]
fit= lm(d$new_cases ~ d$new_tests) ##linear regression model with tests predicting cases
summary(fit) ##                     Ignore Blanks 
cor(d$new_cases, 
	d$new_tests, 
	use = "complete.obs")  ##correlation between new cases and tests is .865
options(scipen=999) ##remove scientific notation
plot(d$new_cases~ d$new_tests)
plot(d$new_cases, 
	d$new_tests, 
	main='Regression Between New Cases and New Tests' ,
	xlab='Cases',
	ylab='Tests',
	xlim=c(0,300000),
	ylim=c(0,2500000), 
	pch=20, 
	col= 'blue')
abline(lm(new_tests ~ new_cases, 
	data= d), 
	col = 'red' , 
	lwd = 3 )
legend("topleft",
	legend = c("Correlation = .865",
	col = "R-Squared = .75"
	))


fit2= lm(d$new_deaths ~ d$new_cases 
	+ d$new_cases_smoothed + 
	d$new_cases_smoothed_per_million)
summary(fit2) ##                       Ignore Blanks
cor(d$new_deaths, 
	d$new_cases, 
	use = "complete.obs") ##correlation between new deaths and new cases is .92
##new cases, new cases smoothed and new cases smoothed per million are all statistically significant
plot(d$new_cases_smoothed, 
	d$new_deaths, 
	main='Regression Between New Cases and New Deaths' ,
	xlab='Cases',
	ylab='Deaths',
	ylim=c(0,30000),  
	pch=20, 
	col= 'cyan')
abline(lm(new_deaths ~ new_cases_smoothed, 
	data= d), 
	col = 'black', 
	lwd = 3 )
legend("topleft",
	legend = c("Correlation = .92",
	col = "R-Squared = .85"
	))



fit3= lm(d$weekly_hosp_admissions ~ d$new_cases)
summary(fit3)
cor(d$weekly_hosp_admissions , 
	d$new_cases, 
	use = "complete.obs")
plot(  d$weekly_hosp_admissions,
	d$new_cases ,
	main='Regression Between New Cases and Weekly Hospital Admissions' ,
	xlab='New Cases',
	ylab='Weekly Hospital Admissions',
	xlim=c(0,60000) , 
	pch=20, 
	col= 'purple')
#abline(lm(new_cases ~ weekly_hosp_admissions , 
	data= d), 
	col = 'brown', 
	lwd = 3 )
legend("topleft",
	legend = c("Correlation = .61",
	col = "R-Squared = .37"
	))





     