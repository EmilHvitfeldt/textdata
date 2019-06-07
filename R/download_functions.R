#' List of all download functions used in load_dataset
#'
#' @format Named list of all download functions
#' @include dataset_afinn.R dataset_sentence_polarity.R
"download_functions"
download_functions <- list(
  afinn = download_afinn,
  sentence_polarity = download_sentence_polarity,
  loughran = download_loughran
)
