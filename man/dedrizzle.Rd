% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dedrizzle.R
\name{dedrizzle}
\alias{dedrizzle}
\title{Removes excess drizzle from model data.}
\usage{
dedrizzle(x, att = FALSE)
}
\arguments{
\item{x}{A list of vectors named "obs", "cur", and "fut".  The
vectors do not need to be the same length.}

\item{att}{Logical: whether to set attributes "pwet" and
"threshold" on the returned list to record the wet/dry ratio and
threshold value, respectively.  (Defaults to FALSE.)}
}
\value{
A list containing obs, cur, and fut with drizzle removed.
}
\description{
Climate models typically generate too much drizzle.  Given modeled
and observational precipitation, \code{dedrizzle} finds a
threshold value that will cause the wet/dry ratio in the model
data to match the wet/dry ratio in the observations, then sets all
model values below that threshold to zero.
}
\details{
\code{dedrizzle} takes two vectors of model data, one for the
current period and one for the future period.  It finds the
threshold based on the current data, and floors data below the
threshold for both current and future data.  If the observational
data has more wet (non-zero) values than the model data, the
threshold will be zero.

Dedrizzle floors all its inputs at zero before calculation.  It
ignores NA values when calculating the wet/dry equalization
threshold.  The "fut" element of the input list is optional.
}
\examples{
obs <- c(rep(0,10), rep(1,10), rep(NA,3))
cur <- c(seq(10)/10, NA)
fut <- seq(15)/10
namelist(obs,cur,fut)
dedrizzle(namelist(obs, cur, fut))

}
