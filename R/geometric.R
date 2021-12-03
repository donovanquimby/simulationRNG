#' Generate n pseudo random numbers from a geometric distribution.
#'
#' @param n the number of pseudo random geometric numbers to generate. 
#' Defaults to 1.
#' @param p probability of success. Defaults to 0.5.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of geometric random variants of length n
#' @examples
#' geometric(n=1e5, p= .3)
#' @export

geometric <- function(n=1, p=.5, seed = as.integer(Sys.time())){
    u <- unif(n=n,seed=seed)
    x <- ceiling(log(1-u)/log(1-p))
    return(x)
}


