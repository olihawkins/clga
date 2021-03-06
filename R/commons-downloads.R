### Functions for downloading events data for for Commons research briefings

# Sets of pages: Parliament website -------------------------------------------

#' Download data on document downloads for all Commons research briefing
#' landing pages on the main Parliamentary website
#'
#' \code{fetch_crb_downloads_public} downloads data on document download
#' metrics for all Commons Library research briefings during the given dates
#' and returns the data as a tibble. These are the landing pages for briefings
#' whose codes begin with "SN", "CBP" or "CDP".
#'
#' Note that this is not all Commons research briefing downloads, as it does
#' not include downloads on the research briefing pages on the Parliamentary
#' intranet. Use \code{fetch_crb_downloads_intranet} to retrieve equivalent
#' data for the Parliamentary intranet.
#'
#' By default, download figures are reported separately for each website
#' property in Google Analytics that contains some of the requested data. You
#' can use the \code{combine} argument to optionally combine download figures
#' so that each result appears only once with figures totalled across all
#' relevant properties.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' If \code{combine} and \code{merge_paths} are both set to TRUE, rows for
#' different properties are combined before paths are merged.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param internal A boolean indicating whether to return only the results for
#'   downloads from internal parliamentary networks. The default is FALSE.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param combine A boolean indicating whether to combine the totals from
#'   different properties or to report them separately. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of document download metrics.
#' @export

fetch_crb_downloads_public <- function(
    start_date,
    end_date,
    internal = FALSE,
    by_date = FALSE,
    by_page = FALSE,
    combine = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_public_by_type(
        start_date = start_date,
        end_date = end_date,
        type_regexp = PATH_REGEXP_RB_CRB,
        internal = internal,
        by_date = by_date,
        by_page = by_page,
        combine = combine,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

#' Download data on document downloads for all Commons briefing paper landing
#' pages on the main Parliamentary website
#'
#' \code{fetch_cbp_downloads_public} downloads data on document download
#' metrics for all Commons Library briefing papers during the given dates and
#' returns the data as a tibble. These are the landing pages for briefings
#' whose ids begin with "SN" or "CBP".
#'
#' Note that this is not all Commons briefing paper downloads, as it does not
#' include downloads on the briefing paper pages on the Parliamentary intranet.
#' Use \code{fetch_cbp_downloads_intranet} to retrieve equivalent data for
#' the Parliamentary intranet.
#'
#' By default, download figures are reported separately for each website
#' property in Google Analytics that contains some of the requested data. You
#' can use the \code{combine} argument to optionally combine download figures
#' so that each result appears only once with figures totalled across all
#' relevant properties.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its traffic data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' If \code{combine} and \code{merge_paths} are both set to TRUE, rows for
#' different properties are combined before paths are merged.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param internal A boolean indicating whether to return only the results for
#'   downloads from internal parliamentary networks. The default is FALSE.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param combine A boolean indicating whether to combine the totals from
#'   different properties or to report them separately. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of traffic metrics.
#' @export

fetch_cbp_downloads_public <- function(
    start_date,
    end_date,
    internal = FALSE,
    by_date = FALSE,
    by_page = FALSE,
    combine = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_public_by_type(
        start_date = start_date,
        end_date = end_date,
        type_regexp = PATH_REGEXP_RB_CBP,
        internal = internal,
        by_date = by_date,
        by_page = by_page,
        combine = combine,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

#' Download data on document downloads for all Commons debate pack landing
#' pages on the main Parliamentary website
#'
#' \code{fetch_cdp_downloads_public} downloads data on document download
#' metrics for all Commons Library debate packs during the given dates and
#' returns the data as a tibble. These are the landing pages for briefings
#' whose ids begin with "CDP".
#'
#' Note that this is not all Commons debate pack downloads, as it does not
#' include downloads on the debate pack pages on the Parliamentary intranet.
#' Use \code{fetch_cdp_downloads_intranet} to retrieve equivalent data for the
#' Parliamentary intranet.
#'
#' By default, download figures are reported separately for each website
#' property in Google Analytics that contains some of the requested data. You
#' can use the \code{combine} argument to optionally combine download figures
#' so that each result appears only once with figures totalled across all
#' relevant properties.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' If \code{combine} and \code{merge_paths} are both set to TRUE, rows for
#' different properties are combined before paths are merged.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param internal A boolean indicating whether to return only the results for
#'   downloads from internal parliamentary networks. The default is FALSE.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param combine A boolean indicating whether to combine the totals from
#'   different properties or to report them separately. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of traffic metrics.
#' @export

fetch_cdp_downloads_public <- function(
    start_date,
    end_date,
    internal = FALSE,
    by_date = FALSE,
    by_page = FALSE,
    combine = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_public_by_type(
        start_date = start_date,
        end_date = end_date,
        type_regexp = PATH_REGEXP_RB_CDP,
        internal = internal,
        by_date = by_date,
        by_page = by_page,
        combine = combine,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

# Sets of pages: Intranet -----------------------------------------------------

#' Download data on document downloads for all Commons research briefing
#' landing pages on the Parliamentary intranet
#'
#' \code{fetch_crb_downloads_intranet} downloads data on document download
#' metrics for all Commons Library research briefings on the intranet during
#' the given dates and returns the data as a tibble. These are the landing
#' pages for briefings whose ids begin with "SN", "CBP", or "CDP".
#'
#' Note that this is not all research briefings downloads, as it does not
#' include downloads on the research briefings pages on the main Parliament
#' website. Use \code{fetch_crb_downloads_public} to retrieve equivalent data
#' for the main Parliament website.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of document download metrics.
#' @export

fetch_crb_downloads_intranet <- function(
    start_date,
    end_date,
    by_date = FALSE,
    by_page = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_intranet_by_type(
        start_date = start_date,
        end_date = end_date,
        type_regexp = PATH_REGEXP_RB_CRB,
        by_date = by_date,
        by_page = by_page,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

#' Download data on document downloads for all Commons briefing paper landing
#' pages on the Parliamentary intranet
#'
#' \code{fetch_cbp_downloads_intranet} downloads data on document download
#' metrics for all Commons Library briefing papers on the intranet during the
#' given dates and returns the data as a tibble. These are the landing pages
#' for briefings whose ids begin with "SN" or "CBP".
#'
#' Note that this is not all Commons briefing paper downloads, as it does not
#' include downloads on briefing paper pages on the main Parliament website.
#' Use \code{fetch_cbp_downloads_public} to retrieve equivalent data for the
#' main Parliament website.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of document download metrics.
#' @export

fetch_cbp_downloads_intranet <- function(
    start_date,
    end_date,
    by_date = FALSE,
    by_page = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_intranet_by_type(
        start_date = start_date,
        end_date = end_date,
        type_regexp = PATH_REGEXP_RB_CBP,
        by_date = by_date,
        by_page = by_page,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

#' Download data on document downloads for all Commons debate pack landing
#' pages on the Parliamentary intranet
#'
#' \code{fetch_cdp_downloads_intranet} downloads data on document download
#' metrics for all Commons Library debate packs on the intranet during the
#' given dates and returns the data as a tibble. These are the landing pages
#' for briefings whose ids begin with "CDP".
#'
#' Note that this is not all debate pack downloads, as it does not include
#' downloads on the debate pack pages on the main Parliament website. Use
#' \code{fetch_cdp_downloads_public} to retrieve equivalent data for the main
#' Parliament website.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of document download metrics.
#' @export

fetch_cdp_downloads_intranet <- function(
    start_date,
    end_date,
    by_date = FALSE,
    by_page = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_intranet_by_type(
        start_date = start_date,
        end_date = end_date,
        type_regexp = PATH_REGEXP_RB_CDP,
        by_date = by_date,
        by_page = by_page,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

# Sets of pages: All research briefings ---------------------------------------

#' Download data on document downloads for all Commons research briefings in
#' both the research briefings view and the research briefings intranet view
#'
#' \code{fetch_crb_downloads} downloads data on document download metrics for
#' all Commons research briefings on both the public Parliament website and the
#' Parliamentary intranet during the given dates and returns the data as a
#' tibble.
#'
#' The data can either be combined so that each result appears once with
#' totals across all properties for the Parliament website and the intranet,
#' or reported separately with separate rows for each property.
#'
#' By default, download figures are reported separately for each website
#' property in Google Analytics that contains some of the requested data. You
#' can use the \code{combine} argument to optionally combine download figures
#' so that each result appears only once with figures totalled across all
#' relevant properties.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' If \code{combine} and \code{merge_paths} are both set to TRUE, rows for
#' different properties are combined before paths are merged.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param internal A boolean indicating whether to return only the results for
#'   downloads from internal parliamentary networks. The default is FALSE.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param combine A boolean indicating whether to combine the totals from
#'   different properties or to report them separately. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of traffic metrics.
#' @export

fetch_crb_downloads <- function(
    start_date,
    end_date,
    internal = FALSE,
    by_date = FALSE,
    by_page = FALSE,
    combine = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_all_properties(
        fetch_crb_downloads_public,
        fetch_crb_downloads_intranet,
        start_date = start_date,
        end_date = end_date,
        internal = internal,
        by_date = by_date,
        by_page = by_page,
        combine = combine,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

#' Download data on document downloads for all Commons briefing papers in both
#' the research briefings view and the research briefings intranet view
#'
#' \code{fetch_cbp_downloads} downloads data on document download metrics for
#' all Commons briefing papers on both the public Parliament website and the
#' Parliamentary intranet during the given dates and returns the data as a
#' tibble.
#'
#' By default, download figures are reported separately for each website
#' property in Google Analytics that contains some of the requested data. You
#' can use the \code{combine} argument to optionally combine download figures
#' so that each result appears only once with figures totalled across all
#' relevant properties.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' If \code{combine} and \code{merge_paths} are both set to TRUE, rows for
#' different properties are combined before paths are merged.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param internal A boolean indicating whether to return only the results for
#'   downloads from internal parliamentary networks. The default is FALSE.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param combine A boolean indicating whether to combine the totals from
#'   different properties or to report them separately. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of document download metrics.
#' @export

fetch_cbp_downloads <- function(
    start_date,
    end_date,
    internal = FALSE,
    by_date = FALSE,
    by_page = FALSE,
    combine = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_all_properties(
        fetch_cbp_downloads_public,
        fetch_cbp_downloads_intranet,
        start_date = start_date,
        end_date = end_date,
        internal = internal,
        by_date = by_date,
        by_page = by_page,
        combine = combine,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}

#' Download data on document downloads for all Commons debate packs in both the
#' research briefings view and the research briefings intranet view
#'
#' \code{fetch_cdp_downloads} downloads data on document download metrics for
#' all Commons debate packs on both the public Parliament website and the
#' Parliamentary intranet during the given dates and returns the data as a
#' tibble.
#'
#' By default, download figures are reported separately for each website
#' property in Google Analytics that contains some of the requested data. You
#' can use the \code{combine} argument to optionally combine download figures
#' so that each result appears only once with figures totalled across all
#' relevant properties.
#'
#' Download figures can be requested by page. Google Analytics treats webpages
#' requested with different query strings and section anchors as different
#' pages in its downloads data. You can use the \code{merge_paths} argument to
#' optionally sum the figures for pages with the same base path.
#'
#' If \code{combine} and \code{merge_paths} are both set to TRUE, rows for
#' different properties are combined before paths are merged.
#'
#' @param start_date The start date as an ISO 8601 string.
#' @param end_date The end date as an ISO 8601 string.
#' @param internal A boolean indicating whether to return only the results for
#'   downloads from internal parliamentary networks. The default is FALSE.
#' @param by_date A boolean indicating whether to return the results broken
#'   down by date. The default is FALSE.
#' @param by_page A boolean indicating whether to return the results broken
#'   down by page. The default is FALSE.
#' @param combine A boolean indicating whether to combine the totals from
#'   different properties or to report them separately. The default is FALSE.
#' @param merge_paths A boolean indicating whether to aggregate figures for all
#'   pages that have the same root path i.e. for all pages whose paths differ
#'   only by their query strings or internal anchors. This parameter is ignored
#'   if \code{by_page} is set to FALSE. The default value is FALSE.
#' @param anti_sample A boolean indicating whether to use googleAnalyticsR's
#'   anti-sample feature, which chunks API calls to keep the number of records
#'   requested under the API limits that trigger sampling. This makes the
#'   download process slower but ensures that all records are returned. Only
#'   use this feature if you see that an API request triggers sampling without
#'   it. The default is FALSE.
#' @param use_resource_quotas A boolean indicating whether to use the resource
#'   quotas in Parliament's Google Analytics account to prevent sampling.
#'   This is a faster and more effective way to disable sampling than using
#'   \code{anti_sample}, but using resource quotas consumes tokens from a
#'   limited daily quota. Use this when \code{anti_sample} still fails to
#'   prevent sampling or is taking too long. Note that using resource quotas
#'   takes precendence over anti-samping: if \code{use_resource_quotas} is TRUE
#'   \code{anti_sample} is automatically set to FALSE. The default is FALSE.
#' @return A tibble of document download metrics.
#' @export

fetch_cdp_downloads <- function(
    start_date,
    end_date,
    internal = FALSE,
    by_date = FALSE,
    by_page = FALSE,
    combine = FALSE,
    merge_paths = FALSE,
    anti_sample = FALSE,
    use_resource_quotas = FALSE) {

    fetch_rb_downloads_all_properties(
        fetch_cdp_downloads_public,
        fetch_cdp_downloads_intranet,
        start_date = start_date,
        end_date = end_date,
        internal = internal,
        by_date = by_date,
        by_page = by_page,
        combine = combine,
        merge_paths = merge_paths,
        anti_sample = anti_sample,
        use_resource_quotas = use_resource_quotas)
}
