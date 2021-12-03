#' Generate n pseudo random numbers from a binomial distribution.
#'
#' @param n the number of pseudo random binomial variants to generate. 
#' Defaults to 1.
#' @param p probability of success. Defaults to 0.5.
#' @param k Number of n independent Bernoulli trials. Defaults to 5.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of binomial random variants of length n
#' @examples
#' binom(n=1e5, p= 0.2, k=5)
#' @export


binom <- function(n=1, p=.5, k=5, seed = as.integer(Sys.time())){
    
    set.seed(seed)
    
    trials = c()
    for(i in 1:n){
        b <- bern(n=k, p=p , seed = sample(1:1e7, 1))
        trials[i]=sum(b)
    }
    
    return(trials)
    
}