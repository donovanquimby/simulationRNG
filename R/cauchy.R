#' Generate n pseudo random numbers from a cauchy distribution.
#'
#' @param n the number of pseudo random geometric numbers to generate. 
#' Defaults to 1.
#' @param t Location parameter. Defaults to 0.
#' @param s scaling parameter. Defaults to 1.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of cauchy random variants of length n
#' @examples
#' cauchy(n=1e5, t = -2, s = 2)
#' @export



cauchy <- function(n=1, t = 0,  s = 1, seed = as.integer(Sys.time())){
    # t is the location and s is the scale factor
    
    u <- unif(n,seed=seed)
    X <- s*(tan(2*pi*u)) + t
    return(X)
    
}