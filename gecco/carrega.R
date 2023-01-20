library(EventDetectR)
library(dplyr)

carrega <- function() {
  gecco <- geccoIC2018Train
  row.names(gecco) <- gecco$Time
  reference <- subset(gecco, select=c(EVENT))
  data <- subset(gecco, select = -c(EVENT, Time))

  dataset <- list()
  i = 1
  
  for (i in 1:length(data)) {
    serie <- data %>% select(i)
    dataset <- c(dataset, serie)
  }
  
  dataset <- c(dataset, reference)
  
  return(dataset)
}

dataset <- carrega()
