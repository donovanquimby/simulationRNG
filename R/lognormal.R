#' Generate n pseudo random numbers from a lognormal distribution with mean 'mu' and
#' standard deviation 'sd'
#'
#' @param n the number of pseudo random lognormal numbers to generate. 
#' Defaults to 1.
#' @param mu mean of normal distribution. Defaults to 0.
#' @param sd standard deviation of normal distribution. Defaults to 0.25.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of PRNs from specified normal distribution of length n
#' @examples
#' lognormal(n=1e6, mu=0, sd = 3, seed = 123)
#' @export

lognormal <- function(n=1, mu=0, sd=0.25, seed=as.integer(Sys.time())){
    
    set.seed(seed)
    
    norms <- normal(n=n,mu=mu,sd=sd, seed=sample(1:1e7, 1))
    X <- exp(norms)
    return(X)
}