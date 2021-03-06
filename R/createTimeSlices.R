## From Tony Cooper <tonyc@iconz.co.nz> on 1/9/13

createTimeSlices <- function(y, initialWindow, horizon = 1, fixedWindow = TRUE, windowStep = 1) {
  ## initialwindowlength = initial number of consecutive values in each training set sample
  ## horizonlength = number of consecutive values in test set sample
  ## fixedwindowlength = FALSE if we use the maximum possible length for the training set
  ## Ensure that initialwindowlength + horizonlength <= length(y)
  
  print(paste("windowStep=", horizon))
  stops <- (seq(from=initialWindow, to=(length(y) - horizon), by=horizon))
  
  if (fixedWindow) {
    starts <- stops - initialWindow + 1
  } else {
    starts <- rep(1, length(stops)) # all start at 1
  }
  
  train <- mapply(seq, starts, stops, SIMPLIFY = FALSE)
  test <- mapply(seq, stops+1, stops+horizon, SIMPLIFY = FALSE)
  names(train) <- paste("Training", gsub(" ", "0", format(seq(along = train))), sep = "")
  names(test) <- paste("Testing", gsub(" ", "0", format(seq(along = test))), sep = "")
  out <- list(train = train, test = test)
  
  out
}


## This will reproduce the 4 examples above
#createTimeSlices(1:9, 5, 1, fixedWindow = FALSE)
#createTimeSlices(1:9, 5, 1, fixedWindow = TRUE)
#createTimeSlices(1:9, 5, 3, fixedWindow = TRUE)
#createTimeSlices(1:9, 5, 3, fixedWindow = FALSE)