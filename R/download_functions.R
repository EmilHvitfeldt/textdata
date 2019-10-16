#' List of all download functions used in load_dataset
#'
#' @format Named list of all download functions
#' @include lexicon_afinn.R lexicon_loughran.R lexicon_bing.R lexicon_nrc.R
#' @include dataset_sentence_polarity.R dataset_ag_news.R dataset_dbpedia.R
#' @include dataset_trec.R dataset_imdb.R lexicon_nrc_eil.R lexicon_nrc_vad.R
#' @include embedding_glove.R
#' @noRd
"download_functions"
download_functions <- list(
  afinn = download_afinn,
  sentence_polarity = download_sentence_polarity,
  loughran = download_loughran,
  bing = download_bing,
  nrc = download_nrc,
  nrc_eil = download_nrc_eil,
  nrc_vad = download_nrc_vad,
  ag_news = download_ag_news,
  dbpedia = download_dbpedia,
  trec = download_trec,
  imdb = download_imdb,
  glove6b = download_glove6b,
  glove27b = download_glove27b,
  glove42b = download_glove42b,
  glove840b = download_glove840b
)
