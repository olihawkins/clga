% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/briefings-events.R
\name{fetch_rb_downloads_intranet_by_type}
\alias{fetch_rb_downloads_intranet_by_type}
\title{Download data on document downloads for different types of Commons research
briefings on the Parliamentary intranet}
\usage{
fetch_rb_downloads_intranet_by_type(
  start_date,
  end_date,
  type_regexp = PATH_REGEXP_ALL,
  by_date = FALSE,
  by_page = FALSE,
  merge_paths = FALSE,
  anti_sample = FALSE,
  use_resource_quotas = FALSE
)
}
\arguments{
\item{start_date}{The start date as an ISO 8601 string.}

\item{end_date}{The end date as an ISO 8601 string.}

\item{type_regexp}{A regular expression that describes the page path for one
or more briefing types. The default is a regexp that matches all pages.}

\item{by_date}{A boolean indicating whether to return the results broken
down by date. The default is FALSE.}

\item{by_page}{A boolean indicating whether to return the results broken
down by page. The default is FALSE.}

\item{merge_paths}{A boolean indicating whether to aggregate figures for all
pages that have the same root path i.e. for all pages whose paths differ
only by their query strings or internal anchors. This parameter is ignored
if \code{by_page} is set to FALSE. The default value is FALSE.}

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
A tibble of document download metrics.
}
\description{
\code{fetch_rb_downloads_intranet_by_type} downloads data on document
download metrics for specific types of research breifing based on their id
prefixes during the given dates and returns the data as a tibble. The
specific types of briefings to return are defined with a regular expression
that identifies their id prefixes within the page path.
}
\details{
Note that this function only returns data for the Parliamentary intranet.
Use \code{fetch_rb_downloads_public_by_type} to retrieve equivalent data
for the main Parliamentary website.

Download figures can be requested by page. Google Analytics treats webpages
requested with different query strings and section anchors as different
pages in its downloads data. You can use the \code{merge_paths} argument to
optionally sum the figures for pages with the same base path.
}
