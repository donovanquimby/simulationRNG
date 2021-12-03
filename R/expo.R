#' Generate n pseudo random numbers from a exponential distribution.
#'
#' @param n the number of pseudo random exponential numbers to generate. 
#' Defaults to 1.
#' @param lambda rate parameter lambda of the distribution. Defaults to 1.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of  exponential random variants of length n
#' @examples
#' expo(n=1500, lambda = 6)
#' @export

expo <- function(n=1, lambda=1, seed=as.integer(Sys.time())){
    
    u <- unif(n=n,seed=seed)
    expo <- log(1-u)/(-lambda)
    return(expo)
}
