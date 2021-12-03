#' Generate n pseudo random numbers from a triangular distribution starting at 
#' 'min', having an expected value of 'peak', and a maximum at 
#' 'max'.
#'
#' @param n the number of pseudo triangular variants to generate. 
#' Defaults to 1.
#' @param min Lower bound of distribution. Defaults to 0.
#' @param peak Expected value of distribution. Defaults to 1.
#' @param max Upper bound of distribution. Defaults to 2.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of PRNs from specified triangular distribution of length n
#' @examples
#' triang(n=1e5, min = 2, peak = 6, max = 10)
#' @export

triang <- function(n=1, min =0, peak=1, max = 2, seed=as.integer(Sys.time())){
    
    
    a <- min
    b <- max
    c <- peak
    
    u <- unif(n=n, seed=seed)
    x <- c()
    
    for(i in 1:n){
        if(u[i] < (c-a)/(b-a)){
            x[i] <- a + ((b-a)*(c-a)*u[i])^0.5
        }
        
        else{
            x[i] <- b - ((b-a)*(b-c)*(1-u[i]))^0.5
        }
    }
    return(x)
}