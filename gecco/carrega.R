library(EventDetectR)
library(dplyr)

carrega <- function() {
  #Dataset origin
  gecco <- geccoIC2018Train
  row.names(gecco) <- gecco$Time
  #Event labels
  reference <- subset(gecco, select=c(EVENT))
  #Series without labels or time column
  data <- subset(gecco, select = -c(EVENT, Time))

  #Dataset organized with series, divided into a list
  dataset <- list()
  i = 1
  
  for (i in 1:length(data)) {
    serie <- data %>% select(all_of(i))
    dataset <- c(dataset, serie)
  }
  
  #Adding the labels to the end of the dataset
  dataset <- c(dataset, reference)
  
  return(dataset)
}

dataset <- carrega()
