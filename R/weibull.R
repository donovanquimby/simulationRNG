#' Generate n pseudo random numbers from a Weibull distribution.
#'
#' @param n the number of pseudo random Weibull numbers to generate. 
#' Defaults to 1.
#' @param lambda Scale parameter of the distribution. Defaults to 1.
#' @param k shape parameter of the distribution. Defaults to 1.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of Weibull random variants of length n
#' @examples
#' weibull(n=1e5, lambda = 1, k = 1)

#' @export


weibull <- function(n=1, lambda=1, k =1, seed=as.integer(Sys.time())){
    
    u <- unif(n=n,seed=seed)
    w <- (1/lambda)*((-log(u))^(1/k))
    return(w)
}
