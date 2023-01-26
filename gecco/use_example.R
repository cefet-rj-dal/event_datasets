#install.packages("strucchange")
library(strucchange)
#install.packages("TSA")
library(TSA)
#install.packages("urca")
library(urca)
#install.packages("mFilter")
library(mFilter)


source("carrega.R")
data <- carrega()

#Select subset one day of pH series with synthetic events
test <- subset(data$gecco, select = c(ph))
test <- test$ph[16500:18000]


#Plotting original series
plot(ts(test),type="l",
     ylab="value",
     xlab="time")

#Autocorrelation function
plot(TSA::acf(ts(test), plot=FALSE, na.action = na.pass), main="")



#Stationarity analysis
#Unit root identification in the series
#ADF test
adf_res <- ur.df(ts(test),
                type = "trend",
                lags = 30,
                selectlags = "AIC"
                )

summary(adf_res)
#Compare test statistic values with critical values
#If value teststat > cval => Reject the null hypothesis ==> That is, the series is non-stationary
summary(adf_res)@teststat
summary(adf_res)@cval
