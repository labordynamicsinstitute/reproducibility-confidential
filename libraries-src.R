####################################
# global libraries used everywhere #
####################################
mran.date <- "2021-10-01"

get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}


pkgTest <- function(x)
{
	if (!require(x,character.only = TRUE))
	{
		install.packages(x,dep=TRUE)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
	return("OK")
}

# first, we need to recomplie a few packages, so we set the library to the source library

if (get_os()=="linux") {
## Rstudio Package Manager
  options(repos = c(REPO_NAME = paste0("https://packagemanager.rstudio.com/all/",mran.date,"+Y3JhbiwyOjQ1MjYyMTU7NDJGRDU3MTc")))
} else {
## MRAN
  options(repos=paste0("https://cran.microsoft.com/snapshot/",mran.date,"/"))
}


# force re-install of Rcpp - as of 2021-10-28, there's an incompatibility in some function
# error: function 'Rcpp_precious_remove' not provided by package 'Rcpp'
install.packages("Rcpp",dep=TRUE)

# Also need to re-link sf to libproj15 (not 12)
install.packages("sf")
# need to relink rgdal
install.packages("rgdal")

# now we should be able to install the binary packages, which is faster.
