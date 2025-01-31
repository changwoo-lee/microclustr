% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/error_rates.R
\name{fdr_fun}
\alias{fdr_fun}
\alias{mean_fdr}
\title{Calculates false discovery rate (FDR) when the ground truth is available}
\usage{
fdr_fun(z, id, use_apply = F)

mean_fdr(zm, id, use_apply = F)
}
\arguments{
\item{z}{Vector of cluster assignments}

\item{id}{Vector of true cluster assignments (ground truth)}

\item{use_apply}{Logical (default F), whether to use \code{apply()} to calculate the rate. 
Setting \code{use_apply = T} may be slower but memory efficient when \code{length(z)} is large.}

\item{zm}{Matrix with posterior samples of cluster assignments, where each row corresponds to one sample from the posterior}
}
\value{
False discovery rate (FDR)
}
\description{
False discovery rate (FDR) of the estimated record linkage (partition) based on the ground truth is defined as (Steorts, 2015)
\deqn{FDR = \frac{FP}{CL + FP}}
where FP is the number of false positives (not linked under the truth but linked under the estimate) and CL is the number of correct links (true positives). 
If both FP=0 and CL=0, define FDR = 0. 

FDR can be also defined as \eqn{FDR = 1 - Precision}, where \eqn{Precision = CL/(CL+FP)}.

\code{fdr_fun} calculates FDR for an estimated partition, and \code{mean_fdr} calculates average FDR based on posterior samples of partition.
}
\examples{
nclusters_per_size <- c(50,50,50,50)
numberFields <- 5
numberCategories <- rep(10,5)
trueBeta <- 0.01
# generate simulated data
simulatedData <- SimData(nclusters_per_size, numberFields, numberCategories, trueBeta)
# Fit ESCD model
posteriorESCD <- SampleCluster(data=simulatedData, Prior="ESCD", burn=0, nsamples=10)
# true number of clusters
trueK = sum(nclusters_per_size)
# true cluster membership vector
trueid = rep(1:trueK, times=rep(1:length(nclusters_per_size), times=nclusters_per_size))
# FDR calculation for a single estimate
fdr_fun(posteriorESCD$Z[10,], trueid)
# average FDR calculation
mean_fdr(posteriorESCD$Z, trueid)

}
\references{
Steorts, R. C. (2015). Entity resolution with empirically motivated priors. Bayesian Analysis, 10(4), 849-875.
}
\seealso{
\code{\link{fnr_fun}}, \code{\link{mean_fnr}}
}
