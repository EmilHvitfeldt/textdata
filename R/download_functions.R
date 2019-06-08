#' List of all download functions used in load_dataset
#'
#' @format Named list of all download functions
#' @include lexicon_afinn.R lexicon_loughran.R lexicon_bing.R
#' @include dataset_sentence_polarity.R
#' @noRd
"download_functions"
download_functions <- list(
  afinn = download_afinn,
  sentence_polarity = download_sentence_polarity,
  loughran = download_loughran,
  bing = download_bing
)
