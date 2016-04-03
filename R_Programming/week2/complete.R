## 'directory' is the folder where the polution data csv files are located
## 'id' is a vector of the ids of all stations to include in the study
## ************************************************************************
complete <- function(directory, id = 1:332) {
  # vector to collect the num of observations for each id
  nobs <- vector("integer")
  
  # iterate over all station ids that are specified, introduce padding to go from id to file name
  for (filename in sprintf("%03d", id)) {
    # read a single data file for all its data
    allData <- read.csv(paste0(directory, "/", filename, ".csv"))
    
    # collect the num of observation for this data file
    nobs <- c(nobs, sum(complete.cases(allData)))
  }
  
  # return the data frame with id and nobs
  data.frame(id, nobs)
}