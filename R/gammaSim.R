#' Generate n pseudo random numbers from a gamma distribution.
#'
#' @param n the number of pseudo random gamma numbers to generate. 
#' Defaults to 1.
#' @param shape Shape parameter.  Defaults to 2.
#' @param scale scale parameter. Note this is the inverse of the rate parameter
#'  used in some implementations of the gamma function  Defaults to 1.
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of gamma random variants of length n
#' @examples
#' gammaSim(n=1e5, shape = 3 , scale = 1)
#' @export



gammaSim <- function(n=1, shape= 2 ,scale =1, seed=as.integer(Sys.time())){

    set.seed(seed)
    X <- c()
    Z <- c()
    rate = (1/scale) # inverse 
    
    for(i in 1:n){
        
        if(shape>1){
            d = shape - 1/3
            c = 1/sqrt(9*d)
            u = 5
            k = 0
            
            
            while(log(u)>k){
                z <- normal(seed = sample(1:1e7, 1))
                
                if (z > -1/c){
                    y <- (1+c*z)^3
                    u <- unif(seed = sample(1:1e7, 1))
                    k <- 0.5*(z^2)+ d - d*y+d*log(y)
                }
                
            }
            X[i] <- d*y/rate
            
        }
        
        else{
            x <- gammaSim(shape = (shape+1), scale = (1/rate), seed = sample(1:1e7, 1))
            Z[i] <- x*unif(seed = sample(1:1e7, 1))^(1/shape)
        }
    }  
    
    
    if(length(Z)>0){
        X <- Z
    }
    
    return(X)
    
}