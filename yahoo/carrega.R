library(dplyr)
library(readr)

carrega <- function() {
  #Dataset origin
  series_path = c("A1", "A2", "A3", "A4")
  
  #Series without labels or time column
  #Dataset organized with series, divided into a list
  dataset <- list()
  
  # A1 - Series -------------------------------------------------------------
  files <- list.files(path = series_path[1], pattern = "*.csv")
  files
  
  a1 <- list()
  i = 1
  
  for (i in 1:length(files)) {
    series_file = paste(series_path[1], files[i], sep = "\\")
    print(paste(i, series_file, sep = " : "))
    
    serie <- read_csv(series_file)
    serie <- subset(serie, select = c(value))
    a1[i] <- c(serie)
  }
  
  names(a1) <- files
  
  dataset$a1 <- a1
  

  # A2 - Series -------------------------------------------------------------
  files <- list.files(path = series_path[2], pattern = "*.csv")
  files
  
  a2 <- list()
  i = 1
  
  for (i in 1:length(files)) {
    series_file = paste(series_path[2], files[i], sep = "\\")
    print(paste(i, series_file, sep = " : "))
    
    serie <- read_csv(series_file)
    serie <- subset(serie, select = c(value))
    a2[i] <- c(serie)
  }
  
  names(a2) <- files
  
  dataset$a2 <- a2
  
  
  # A3 - Series -------------------------------------------------------------
  files <- list.files(path = series_path[3], pattern = "*.csv")
  files
  
  a3 <- list()
  i = 1
  
  for (i in 1:length(files)) {
    series_file = paste(series_path[3], files[i], sep = "\\")
    print(paste(i, series_file, sep = " : "))
    
    serie <- read_csv(series_file)
    serie <- subset(serie, select = c(value))
    a3[i] <- c(serie)
  }
  
  names(a3) <- files
  
  dataset$a3 <- a3


  # A4 - Series -------------------------------------------------------------
  files <- list.files(path = series_path[4], pattern = "*.csv")
  files
  
  a4 <- list()
  i = 1
  
  for (i in 1:length(files)) {
    series_file = paste(series_path[4], files[i], sep = "\\")
    print(paste(i, series_file, sep = " : "))
    
    serie <- read_csv(series_file)
    serie <- subset(serie, select = c(value))
    a4[i] <- c(serie)
  }
  
  names(a4) <- files
  
  dataset$a4 <- a4
  
  
  # Return complete dataset -------------------------------------------------
  return(dataset)
}


referencia <- function() {
  #Dataset origin
  series_path = c("A1", "A2", "A3", "A4")
  #Event labels
  
  
  reference <- list()
  return(reference)
}