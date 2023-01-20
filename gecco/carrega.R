library(EventDetectR)
library(dplyr)

carrega <- function() {
  gecco <- geccoIC2018Train
  row.names(gecco) <- gecco$Time
  data <- subset(gecco, select = -c(EVENT, Time))
  
  reference <- subset(gecco, select=c(EVENT))

  dataset <- list(reference)
  
  i = 1
  
  for (i in 1:length(data)) {
    serie <- data %>% select(i)
    dataset <- c(dataset, as.data.frame(serie))
  }
  
  return(dataset)
}

dataset <- carrega()
