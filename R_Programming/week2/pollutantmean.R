## 'directory' is the folder where the polution data csv files are located
## 'pollutant' is the pollutant to be studied
## 'id' is a vector of the ids of all stations to include in the study
## ************************************************************************
pollutantmean <- function(directory, pollutant, id = 1:332) {
  # define a vector that will collect all non-NA values for all specified stations
  collector <- vector("numeric")
  
  # iterate over all station ids that are specified, introduce padding to go from id to file name
  for (filename in sprintf("%03d", id)) {
    # read a single data file for all its data
    allData <- read.csv(paste0(directory, "/", filename, ".csv"))
    
    # extract the pollutant vector and remove all the NA values from it
    values <- allData[[pollutant]]
    usable <- values[!is.na(values)]
    
    # collect all usable values for the final mean evaluation
    collector <- c(collector, usable)
  }
  
  # return the mean of all collected values
  mean(collector)
}