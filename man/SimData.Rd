% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulation.R
\name{SimData}
\alias{SimData}
\title{Generating a simulated dataset using independent fields model}
\usage{
SimData(nclusters_per_size, nfields, ncat, true_beta)
}
\arguments{
\item{nclusters_per_size}{Integer vector, the number of clusters of each size. 
For example, \code{nclusters_per_size = c(3,0,2)} corresponds to three clusters with size 1 (singletons) and two clusters with size 3.
This integer vector is also called \emph{allelic partition}; see also Crane (2016) and Betancourt et al. (2022).}

\item{nfields}{Integer, Number of fields \eqn{L}}

\item{ncat}{Integer vector of \eqn{D_\ell}, the number of categories per field}

\item{true_beta}{Distortion probability for the fields}
}
\value{
Simulated data set, integer (categorical value) matrix where each column corresponds to each field.
}
\description{
\code{SimData} generates a simulated dataset using independent fields model (Steorts et al. 2016). 
This data generation scheme has been used in Section 5.1 of Betancourt et al.(2020), Section 5 of Betancourt et al.(2022) and and Section D.2 of Lee and Sang (2022).

Let \eqn{m_i} be the number of clusters of size \eqn{i} provided by \code{nclusters_per_size} argument. 
Then there are total \eqn{n = \sum_{i} i \times m_i} number of entities, and \code{SimData} generates \eqn{n \times }\code{nfields} tabular dataset  
where \eqn{\ell}th field (column) contains \eqn{D_\ell} categories for \eqn{\ell = 1,\dots,}\code{nfields} where \eqn{D_\ell} are provided by \code{ncat} argument. 

\strong{Generative process}: First, the "true", latent feature \eqn{y_{j\ell}} is independently generated from the discrete uniform distribution on \eqn{1,\dots,D_\ell} which is cluster and field specific. 
Then, given a common distortion probability \eqn{\beta} and cluster membership \eqn{z_i}, the record \eqn{x_{i\ell}} is set as
\deqn{x_{i\ell} = y_{z_i\ell}}
with probability \eqn{1-\beta} (non-distorted) and 
\deqn{x_{i\ell} \sim DiscreteUnif(1,\dots,D_\ell)}
with probability \eqn{\beta} (distorted), independently. 
True cluster membership \eqn{z_1,\dots,z_n} is by default \code{rep(1:K, times=rep(1:length(nclusters_per_size), times=nclusters_per_size))} where \code{K = sum(nclusters_per_size)} is the number of clusters.
}
\examples{
nclusters_per_size <- c(2,2,2,2)
numberFields <- 2
numberCategories <- rep(5,2)
trueBeta <- 0.01
# generate data
simulatedData <- SimData(nclusters_per_size, numberFields, numberCategories, trueBeta)
# true number of clusters
trueK = sum(nclusters_per_size)
# true cluster membership vector
trueid = rep(1:trueK, times=rep(1:length(nclusters_per_size), times=nclusters_per_size))
}
\references{
Crane, H. (2016). The ubiquitous Ewens sampling formula. Statistical science, 31(1), 1-19.

Steorts, R. C., Hall, R., & Fienberg, S. E. (2016). A Bayesian approach to graphical record linkage and deduplication. Journal of the American Statistical Association, 111(516), 1660-1672.

Betancourt, B., Zanella, G., & Steorts, R. C. (2020). Random partition models for microclustering tasks. Journal of the American Statistical Association, 1-13.

Betancourt, B., Sosa, J., & Rodríguez, A. (2022). A prior for record linkage based on allelic partitions. Computational Statistics & Data Analysis, 172, 107474.

Lee, C. J., & Sang, H. (2022). Why the Rich Get Richer? On the Balancedness of Random Partition Models. Proceedings of the 39th International Conference on Machine Learning (ICML), PMLR 162:12521 - 12541.
}
