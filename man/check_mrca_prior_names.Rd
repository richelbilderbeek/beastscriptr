% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_mrca_prior.R
\name{check_mrca_prior_names}
\alias{check_mrca_prior_names}
\title{Check if the MRCA prior,
which is a list, has all the named elements.}
\usage{
check_mrca_prior_names(mrca_prior)
}
\arguments{
\item{mrca_prior}{a Most Recent Common Ancestor prior,
as returned by \code{\link{create_mrca_prior}}}
}
\value{
nothing
}
\description{
Calls \code{stop} if not.
}
\seealso{
Use \link{check_mrca_prior} to check the entire MRCA prior
}
\author{
Richèl J.C. Bilderbeek
}
