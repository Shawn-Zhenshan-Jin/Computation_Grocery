#####################################################################################
##
## Amazon Web Service Rstudio setup
##              AWS Rtudio Virtual Box Setup Tutorial URL: http://www.louisaslett.com/RStudio_AMI/
##              Feature:
##                    1. can be linked to dropbox, cloud access to data in dropbox
##                    2. flexible copmuting resources in AWS
#####################################################################################
## dropbox commands
library(RStudioAMI)
passwd()
linkDropbox()
excludeSyncDropbox("*")
includeSyncDropbox("/path/to/specific/dropbox folder")

## other dependencies
install.packages(""); library()