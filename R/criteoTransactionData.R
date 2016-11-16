#' @title Pull Criteo Transactions Report Data
#' 
#' @description This function manages the complete transactions data download process. The requested data will be returned as a data frame.
#' Wrapper for \code{link{jobStatus}}, \code{link{getCriteoDownloadURL}} and \code{link{getCriteoTransactionData}}.
#' 
#' @param authToken Object created by \code{link{doCriteoAuth}}
#' @param appToken App Token as character string.
#' @param jobID Object created by \code{link{scedCriteoReport}}
#' 
#' @return Data
#' 
#' @export
criteoTransactionData <- function(authToken, appToken, jobID){
  #Simplyfies data download
  #wraps jobStatus(), getCriteoDownloadURL and getCriteoData
  #
  #arguments: authToken
  #           appToken
  #           jobID
  #
  #returns: dataframe
  jobStatus <- getCriteoJobStatus(authToken=authToken, appToken=appToken, jobID=jobID)
  while(jobStatus != "Completed"){ 
    jobStatus <- getCriteoJobStatus(authToken=authToken, appToken=appToken, jobID=jobID)
  }
  URL <- getCriteoDownloadURL(authToken = authToken, appToken = appToken, jobID = jobID)
  data <- getCriteoTransactionData(URL = URL, jobID = jobID)
  data
  
}