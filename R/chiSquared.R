#' Generate n pseudo random numbers from a chi-squared distribution.
#'
#' @param n the number of pseudo random  chi-squared numbers to generate. 
#' Defaults to 1.
#' @param k degrees is the degrees of freedom. Defaults to 1.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of  chi-squared random variants of length n
#' @examples
#' chiSquared(n=1e5, k =6, seed = 155)
#' @export

chiSquared <- function(n=1, k =1,  seed=as.integer(Sys.time())){
    
    X <- c()
    
    set.seed(seed)
    
    for (i in 1:n){
        norms <- normal(n=k, seed=sample(1:1e7, 1))
        X[i] <- sum(norms^2)
    }
    
    return(X)
}