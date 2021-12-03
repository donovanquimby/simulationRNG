#' Generate n pseudo random Uniform(0,1) numbers
#'
#' @param n the number of pseudo random Uniform(0,1) numbers to generate. 
#' Defaults to 1.
#' @param type Method used. Either "lecuyer" or "bfs1987". Defaults to "lecuyer"
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of PRN Uniform(0,1) numbers of length n
#' @examples
#' unif(n = 1e5,seed = 12563)
#' unif(n = 1e5, type = "lecuyer")
#' @export



unif <- function(n=1, type = "bfs1987", seed=as.integer(Sys.time())){ 
    
    
    if (type == 'bfs1987') {
        x <- c()
        r <- c()
        
        for(i in 1:n){
            
            if (i == 1){
                k <- floor(seed/127773)
                x[i] <- 16807*(seed-(127773*k))-(2836*k)
            }
            
            else{
                k <- floor(x[i-1]/127773)
                x[i] <- 16807*(x[i-1]-127773*k)-2836*k
            }
            
            if (x[i]<0){
                x[i]<- x[i]+2147483647
            }
            
        }
        
        r <- x*4.656612875*10^-10
        return(r)
        
    }
    
    
    
    else if (type == 'lecuyer'){
        
        set.seed(seed)
        x1 <- c(sample(1:1e7, 3))
        x2 <- c(sample(1:1e7, 3))
        r <- c()
        
        
        for(i in 4:(n+3)){
            
            x1[4] <- (1403580*x1[2]-810728*x1[1])%%(2^32 - 209)
            x2[4] <- (527612*x2[3]-1370589*x2[1])%%(2^32 - 22853)
            
            y <- (x1[4]-x2[4])%%(2^32-209)
            t <- y/(2^32-209)
            
            r[(i-3)] <- t
            
            x1 <- x1[2:4]
            x2 <- x2[2:4] }
        return(r)
    }
    
    
}




