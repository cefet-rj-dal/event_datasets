library(dplyr)
library(readr)
library(stringr)

carrega <- function() {
  dataset <- list()
  
  arquivo <- "rare.Rds"
  rare <- read_rds(arquivo)
  
  names(rare) <- str_trim(names(rare))
  names(rare) <- str_replace_all(names(rare), " ", "_")
  rare$event <- as.integer(rare$anomaly)
  rare <-subset(rare, select = -c(time, instance, anomaly))

  dataset[[1]] <- rare
  names(dataset) <- "rare"
  
  return(dataset)
}
