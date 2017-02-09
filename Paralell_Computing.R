#####################################################################################
##
## Parallel computing for cross vallidation(Substitude of For Loop)
##      Features: 
##               1. for both loop and nested loop
##               2. including the processing bar(better visualizatoin of the computing prcess)
##
#####################################################################################
library(doSNOW)
library(foreach)

##########
## Initializing parallel for loop parameters
##########
kFold = 5 # Total number of folds
trFold = 3 # Number of training folds
cv_times = ncol(combn(kFold ,trFold)) # Total number of cross validation
lam = seq(0,5, length.out = 100) # tuning parameter sequence(please custmerized it)
Param = expand.grid(fold_idx=1:cv_times, lambda=lam) # Gathering of parameters

## Initalize Parallel backend
core <- parallel:::detectCores()
cl <- makeCluster((core - 1)) # Don't use all of the cores, more efficeint

## Initialization process bar in computing process
registerDoSNOW(cl)
pb <- txtProgressBar(max = length(lam), style = 3)# max: the number of threads during the computing
progress <- function(n) setTxtProgressBar(pb, n)
opts <- list(progress = progress)

## parallel loop
loop <- foreach(i=1:nrow(Param), .combine=rbind, .packages = 'package/used/during/the/parallel/computing', .options.snow = opts) %dopar% {
  # Data Analysis
  
  ## output and tabulate results
  results = cbind(Lambda = Param$lambda[i], 
                  validMSE = , 
                  trainMSE = )
}

# ## Nested Parallel Computing(comment out if necessary)
# loop <- foreach(i = 1:nrow('dataframe/firstDimension'), .combine = 'rbind') %:%
#   foreach(j=1:ncol('dataframe/secondDimension'), .packages = c(), .combine='cbind') %dopar% {
#     # Data Analysis
#     
#     ## output and tabulate results
#     results = cbind(Lambda = Param$lambda[i], 
#                     validMSE = , 
#                     trainMSE = )
# }
stopCluster(cl)
close(pb)

