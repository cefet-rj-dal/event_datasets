library(dplyr)
library(readr)


carrega <- function() {
  #Dataset origin
  series_path = c("A1", "A2", "A3", "A4")
  
  #Dataset with groups organized into a list
  dataset <- list()
  
  #Iteration on series groups
  k = 1
  for (k in 1:length(series_path)) {
    # Group - Series -----------------------------------------------------
    files_sr <- list.files(path = series_path[k], pattern = "*.csv")
    
    #Dataset organized with series into a list
    group = list()
    
    #Iteration in the series of each group
    i = 1
    for (i in 1:length(files_sr)) {
      series_file = paste(series_path[k], files_sr[i], sep = "\\")
      
      
      series <- read_csv(series_file)
      
      #Label column: is_anomaly for A1 and A2 | #anomaly for A3 and A4
      if (series_path[k] == "A1" | series_path[k] == "A2") {
        series <- subset(series, select = c(value, is_anomaly))
      } else {
        series <- subset(series, select = c(value, anomaly))
      }
      
      group[[i]] <- series
      
      #Standard column names
      names(group[[i]]) <- c("series", "event")
    }
    #Each dataframe is given the name of the series in the list
    names(group) <- files_sr
    dataset[[k]] <- group
    
  }
  #Each group is named after the original documentation
  names(dataset) <- series_path
  
  # Return complete dataset -------------------------------------------------
  return(dataset)
}
