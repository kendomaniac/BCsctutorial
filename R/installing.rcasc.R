#' @title A function prepare the environment for the SCA tutorial.
#' @description This function check that dcker is installed and download locally the required docker containers
#' @author Raffaele Calogero, raffaele.calogero [at] unito [dot] it, University of Torino, Italy
#'
#' @examples
#' \dontrun{
#' 
#' installing.rcasc()
#'
#' }
#'
#' @export


installing.rcasc <- function (){
    test <- system("docker -v", intern = TRUE)
    if (length(test) == 0) {
        cat("\nERROR: Docker seems not to be installed in your system\n")
        return(FALSE)
    }
    else {
        cat(paste("\n In your system the following version of Docker is installed:\n", 
            test, sep = ""))
        return(TRUE)
    }
    cat("\nDownloading docker containers required for SCA tutorial\n")
    downloadContainers(group="docker", containers.file="sca")
}
