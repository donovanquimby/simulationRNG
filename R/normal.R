#' Generate n pseudo random numbers from a normal distribution with mean 'mu' and
#' standard deviation 'sd'
#'
#' @param n the number of pseudo random normal variants to generate. 
#' Defaults to 1.
#' @param mu mean of normal distribution. Defaults to 0.
#' @param sd standard deviation of normal distribution. Defaults to 1.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of PRNs from specified normal distribution of length n
#' @examples
#' normal(n=1e6, mu=0, sd = 3, seed = 122)
#' @export

normal <- function(n=1,mu=0,sd=1, seed=as.integer(Sys.time())){
    
    set.seed(seed)
    
    u1 <- unif(n=n,seed=sample(1:1e7, 1))
    u2 <- unif(n=n,seed=sample(1:1e7, 1))
    
    X <- sqrt(-2*log(u1))*cos(2*pi*u2)
    X <- X*sd+mu
    return(X)
}

