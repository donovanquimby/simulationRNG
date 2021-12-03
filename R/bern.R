#' Generate n pseudo random numbers from a Bernoulli distribution.
#'
#' @param n the number of pseudo random Bernoulli numbers to generate. 
#' Defaults to 1.
#' @param p probability of success. Defaults to 0.5.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of Bernoulli random variants of length n
#' @examples
#' bern(n=10000, p = 0.6)
#' @export

bern <- function(n=1,p=.5, seed = as.integer(Sys.time())){
    u <- unif(n=n,seed=seed)
    x=u
    x[x>p] = 0
    x[0 < x & x<= p] = 1
    return(x)    
}