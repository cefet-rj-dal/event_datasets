###########################################################################
## Package provides time series datasets for the event detection task
###########################################################################
# Build package -----------------------------------------------------------
library(devtools)
load_all()

if (FALSE) {
  library(devtools)
  check()
  load_all()
}

if (FALSE) {
  library(devtools)
  document()
  load_all()
}



# Usage examples ----------------------------------------------------------
?dalevents

data(yahoo_a1)
?yahoo_a1

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

data(numenta_grp_all)
?numenta_grp_all
