#Install package
install.packages("devtools")
library(devtools)
devtools::install_github("cefet-rj-dal/event_datasets", force=TRUE, dependencies=FALSE, upgrade="never", build_vignettes = TRUE)
library(dalevents)

# Usage examples ----------------------------------------------------------
#Load a series
data(eia_oil_prices)
series <- eia_oil_prices$Crude_Oil$EER_EPMRU_PF4_Y35NY_DPG

#Use the loaded series
summary(series)
plot(series, type = "l")

#Get information about a series
data(oil_3w_Type_1)
?oil_3w_Type_1

data(gecco)
?gecco

data(mortality_cnes)
?mortality_cnes

data(eia_oil_prices)
?eia_oil_prices

data(fi_br)
?fi_br

data(numenta_realTweets)
?numenta_realTweets

data(rare)
serie <- rare$kafka_network_processor_idlepercent_value_0
?rare

data(ucr)
series <- ucr[[134]]
plot(ts(series), type = "l")
?ucr
