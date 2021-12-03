#' Generate n, k-dimension  pseudo random numbers from normal distributions with 
#' means 'mu' and covariance matrix 'cov_matrix'
#'
#' @param n the number of pseudo random multinormal variant sets to generate. 
#' Defaults to 1.
#' @param cov_matrix kxk covariance matrix where k is the number of dimensions. 
#' Defaults to a 2x2 matrix with SD of 1 and covariance of 0.5. Note that 
#' Covariance matrix must be invertible.
#' @param mu vector of means equal of length k. Defaults to c(0,0).
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return a n x k tibble with each n row corresponding to a set of multi-variant 
#' normal observations
#' @examples
#' cov_matrix = matrix(c(1,0.9,0.9,1), nrow = 2, ncol = 2)
#' multiNormal(n=1e4, cov_matrix = cov_matrix,  mu=c(0,0), seed = 122)
#' @export


multiNormal <- function(n=1, cov_matrix = matrix(c(1,0.5,0.5,1), nrow = 2, ncol = 2), 
                        mu=c(0,0), seed=as.integer(Sys.time())){
    
    set.seed(seed)
    
    sd <- sqrt(diag(cov_matrix))
    k <- length(mu)
    cholesky <- t(chol(cov_matrix))
    
    X <- matrix(0, nrow = n, ncol = k)
    Z <- normal(n=n*k , mu = 0 , sd = 1, seed = sample(1:1e7, 1) )
    
    a <- 1
    for (j in 1:n){
        
        R <- c()
        names <- c()
        z_sub <- Z[a:(a+k-1)]
        
        
        for (i in 1:k){
            
            R[i] <-  sum(cholesky[i,]*z_sub)
            names[i] <-  paste('X', toString(i), sep = "")
            
        }
        
        Xi <- mu + R
        X[j,] <- Xi
        a <- a + k
        
    }
    
    colnames(X) <- names
    X <- as.data.frame(X)
    return(X)
}