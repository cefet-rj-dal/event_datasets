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
#Select subset one series from group A1 (Real data from internet traffic)
reference <- referencia()
test <- data$a1$real_1.csv


#Plotting original series
plot(ts(test), type = "l",
     ylab="value",
     xlab = "time")

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
