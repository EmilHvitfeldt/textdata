#' List of all process functions used in load_dataset
#'
#' @format Named list of all process functions
#' @include download_functions.R
#'
#' @name process_functions
#' @noRd
NULL

process_functions <- list(
  afinn = process_afinn,
  sentence_polarity = process_sentence_polarity,
  loughran = process_loughran,
  bing = process_bing,
  nrc = process_nrc,
  nrc_eil = process_nrc_eil,
  nrc_vad = process_nrc_vad,
  ag_news = process_ag_news,
  dbpedia = process_dbpedia,
  trec = process_trec,
  imdb = process_imdb,
  glove6b = process_glove6b,
  glove27b = process_glove27b,
  glove42b = process_glove42b,
  glove840b = process_glove840b
)
