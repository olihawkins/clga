% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/briefings-traffic.R
\name{fetch_rb_traffic_intranet_by_filter}
\alias{fetch_rb_traffic_intranet_by_filter}
\title{Download traffic data for all pages in the research briefings intranet view
with the given filters}
\usage{
fetch_rb_traffic_intranet_by_filter(
  start_date,
  end_date,
  by_date = FALSE,
  by_page = FALSE,
  dim_filters = NULL,
  anti_sample = FALSE,
  use_resource_quotas = FALSE
)
}
\arguments{
\item{start_date}{The start date as an ISO 8601 string.}

\item{end_date}{The end date as an ISO 8601 string.}

\item{by_date}{A boolean indicating whether to return the results broken
down by date. The default is FALSE.}

\item{by_page}{A boolean indicating whether to return the results broken
down by page. The default is FALSE.}

\item{dim_filters}{A set of dimension filters to constrain the results. The
default is NULL.}

\item{anti_sample}{A boolean indicating whether to use googleAnalyticsR's
anti-sample feature, which chunks API calls to keep the number of records
requested under the API limits that trigger sampling. This makes the
download process slower but ensures that all records are returned. Only
use this feature if you see that an API request triggers sampling without
it. The default is FALSE.}

\item{use_resource_quotas}{A boolean indicating whether to use the resource
quotas in Parliament's Google Analytics account to prevent sampling.
This is a faster and more effective way to disable sampling than using
\code{anti_sample}, but using resource quotas consumes tokens from a
limited daily quota. Use this when \code{anti_sample} still fails to
prevent sampling or is taking too long. Note that using resource quotas
takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
\code{anti_sample} is automatically set to FALSE. The default is FALSE.}
}
\value{
A tibble of traffic metrics.
}
\description{
\code{fetch_rb_traffic_intranet_by_filter} downloads data on traffic metrics
for all research briefings on the Parliamentary intranet during the given
dates, with the given filters, and returns the data as a tibble.
}
\details{
Note that this is not all research briefings traffic, as it does not include
traffic to the research briefings pages on the main Parliament website. Use
\code{fetch_rb_traffic_public_by_filter} to retrieve equivalent data for
the main Parliament website.
}
\keyword{internal}
