% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/samplesESC.R
\name{DataRemap}
\alias{DataRemap}
\title{Remap data to a list of consecutive integers per field}
\usage{
DataRemap(data)
}
\arguments{
\item{data}{Data frame containing only categorical variables}
}
\value{
Data frame of remapped values to consecutive
        list of integers
}
\description{
Remap data to a list of consecutive integers per field
}
\examples{
nclusters_per_size <- c(10,10,10,10)
numberFields <- 5
numberCategories <- rep(10,5)
trueBeta <- 0.01
data <- SimData(nclusters_per_size, numberFields, numberCategories, trueBeta)
DataRemap(data)
}
