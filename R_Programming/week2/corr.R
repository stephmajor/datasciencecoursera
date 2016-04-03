## 'directory' is the folder where the polution data csv files are located
## 'threshold' threshold for complete cases
## ************************************************************************
corr <- function(directory, threshold = 0) {
  # prepare a vector for the results
  results <- vector("numeric")
  
  # start by getting the id and nobs information for all files in the directory
  allFiles <- complete(directory)
  
  # iterate over all files where nobs > threshold
  for (filename in sprintf("%03d", allFiles$id[allFiles$nobs > threshold])) {
    # read a single data file for all its data
    allData <- read.csv(paste0(directory, "/", filename, ".csv"))
    cc <- complete.cases(allData)
    completeData <- subset(allData, cc)
    
    # collect the new result
    results <- c(results, cor(completeData$sulfate, completeData$nitrate))
  }
  
  results
}