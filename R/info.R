print_info <- list(
  afinn =
    list(name = "AFINN-111",
         url = "http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010",
         license = "Open Database License (ODbL) v1.0",
         size = "78 KB",
         type = "lexicon",
         description = ""),
  sentence_polarity =
    list(name = "v1.0 sentence polarity",
         url = "http://www.cs.cornell.edu/people/pabo/movie-review-data",
         license = "Cite the paper when used.",
         size = "2 MB",
         type = "dataset",
         description = "Dataset with sentences labeled with negative or positive sentiment."),
  loughran =
    list(name = "Loughran-McDonald Sentiment lexicon",
         url = "https://sraf.nd.edu/textual-analysis/resources/",
         license = "License required for commercial use. Please contact tloughra@nd.edu.",
         size = "6.7 MB",
         type = "lexicon",
         description = ""),
  bing =
    list(name = "Bing Sentiment Lexicon",
         url = "https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html",
         license = "May be used (research, commercial, etc) with attribution.",
         size = "70 KB",
         type = "lexicon",
         description = "")
)

#' Catalogue of all available data sources
#' @export
"catalogue"
catalogue <- Reduce(rbind, lapply(print_info, as.data.frame,
                                  stringsAsFactors = FALSE))
