#' Generate n pseudo random numbers from a Poisson distribution.
#'
#' @param n the number of pseudo random Poisson numbers to generate. 
#' Defaults to 1.
#' @param lambda Shape parameter indicating the average number off events 
#' in a given time interval. Defaults to 1.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of Poisson random variants of length n
#' @examples
#' poissonSim(n =1e4, lambda=4)
#' @export


poissonSim <- function(n = 1,  lambda =1,  seed = as.integer(Sys.time())){
    # When lambda is less <= 10, the knuth algorithm is used
    # When lambda is less > 10,The method from The Computer Generation of
    # Poisson Random Variables by A. C. Atkinson, Journal of the Royal
    # Statistical Society Series C (Applied Statistics) Vol. 28, No. 1. (1979),
    # pages 29-35. Method PA is on page 32. 
    
    if (lambda > 10){
        
        set.seed(seed)
        c = 0.767 - 3.36/lambda
        beta = pi/sqrt(3.0*lambda)
        alpha = beta*lambda
        k = log(c) - lambda - log(beta)
        
        X <- c()
        
        for(i in 1:n){
            a = 10
            b = 1
            
            while(a > b){
                
                k <- -1
                while(k<0){
                    u = unif(n=2, seed = sample(1:1e7, 1))
                    x = (alpha - log((1.0 - u[1])/u[1]))/beta
                    k = floor(x + 0.5)
                }
                
                
                v =  u[2]
                y = alpha - beta*x
                
                a = y + log(v/(1.0 + exp(y))^2)
                b = k + k*log(lambda) - sum(log(1:k))
                
            }
            X[i] = k
            
        }}
    
    
    else{
        #PM multiplication method
        X <- c()
        set.seed(seed)
        for(i in 1:n){
            
            L <- exp(-lambda)
            k <- 0
            p <- 1
            
            while(p > L){
                k <- k + 1
                u = unif(n=1, seed = sample(1:1e7, 1))
                p <- p*u
            }
            
            X[i] <- k-1
            
            
        }
        
        
    } 
    return(X)
}
