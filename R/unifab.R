#' Generate n pseudo random Uniform(a,b) numbers between a and b
#'
#' @param n the number of pseudo random Uniform(a,b) numbers to generate. 
#' Defaults to 1.
#' @param a Lower bound of distribution. Defaults to 0.
#' @param b Upper bound of distribution. Defaults to 1.
#' @param type Method used. Either "lecuyer" or "bfs1987". Defaults to "lecuyer"
#' @param seed Seed for pseudo random number generating algorithm. Defaults to a
#' integer generated from the system time
#' @return vector of PRN Uniform(a,b) numbers of length n
#' @examples
#' unifab(n=1e5, a = -3, b = 5)
#' unifab(n= 1e5, a = 100, b = 200, type = "bfs1987", seed = 1234)
#' @export



unifab <- function(n=1,a=0,b=1, type = 'lecuyer', seed = as.integer(Sys.time())){
    u <- unif(n=n, type = type, seed=seed)
    x <- a + (b-a)*u
    return(x)
}