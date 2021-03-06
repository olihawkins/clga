% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{merge_traffic_paths}
\alias{merge_traffic_paths}
\title{Aggregate traffic metrics for all pages that have the same root path}
\usage{
merge_traffic_paths(traffic, by_date)
}
\arguments{
\item{traffic}{A tibble of traffic metrics by property, date and page path
returned from one of the fetch_*_traffic functions.}

\item{by_date}{A boolean indicating whether the results are broken down by
date.}
}
\value{
A tibble with the same column structure as the input tibble where
  the metrics have been summed for all pages with the same root path.
}
\description{
\code{merge_paths} takes a tibble of traffic metrics by property, date and
page and sums the metrics for all pages that have the same path i.e. for
all pages whose paths differ only by their query string and internal links.
}
\keyword{internal}
