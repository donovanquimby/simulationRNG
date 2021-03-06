% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multiNormal.R
\name{multiNormal}
\alias{multiNormal}
\title{Generate n, k-dimension  pseudo random numbers from normal distributions with
means 'mu' and covariance matrix 'cov_matrix'}
\usage{
multiNormal(
  n = 1,
  cov_matrix = matrix(c(1, 0.5, 0.5, 1), nrow = 2, ncol = 2),
  mu = c(0, 0),
  seed = as.integer(Sys.time())
)
}
\arguments{
\item{n}{the number of pseudo random multinormal variant sets to generate.
Defaults to 1.}

\item{cov_matrix}{kxk covariance matrix where k is the number of dimensions.
Defaults to a 2x2 matrix with SD of 1 and covariance of 0.5. Note that
Covariance matrix must be invertible.}

\item{mu}{vector of means equal of length k. Defaults to c(0,0).}

\item{seed}{Seed for pseudo random number generating algorithm. Defaults to a
integer generated from the system time}
}
\value{
a n x k tibble with each n row corresponding to a set of multi-variant
normal observations
}
\description{
Generate n, k-dimension  pseudo random numbers from normal distributions with
means 'mu' and covariance matrix 'cov_matrix'
}
\examples{
cov_matrix = matrix(c(1,0.9,0.9,1), nrow = 2, ncol = 2)
multiNormal(n=1e4, cov_matrix = cov_matrix,  mu=c(0,0), seed = 122)
}
