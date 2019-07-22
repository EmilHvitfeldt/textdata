print_info <- list(
  afinn =
    list(name = "AFINN-111",
         url = "http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010",
         license = "Open Database License (ODbL) v1.0",
         size = "78 KB",
         type = "lexicon",
         download_mech = "https",
         description = ""),
  sentence_polarity =
    list(name = "v1.0 sentence polarity",
         url = "http://www.cs.cornell.edu/people/pabo/movie-review-data",
         license = "Cite the paper when used.",
         size = "2 MB",
         type = "dataset",
         download_mech = "https",
         description = "Dataset with sentences labeled with negative or positive sentiment."),
  loughran =
    list(name = "Loughran-McDonald Sentiment lexicon",
         url = "https://sraf.nd.edu/textual-analysis/resources/",
         license = "License required for commercial use. Please contact tloughra@nd.edu.",
         size = "6.7 MB",
         type = "lexicon",
         download_mech = "https",
         description = ""),
  bing =
    list(name = "Bing Sentiment Lexicon",
         url = "https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html",
         license = "May be used (research, commercial, etc) with attribution.",
         size = "70 KB",
         type = "lexicon",
         download_mech = "http",
         description = ""),
  nrc =
    list(name = "NRC Word-Emotion Association Lexicon",
         url = "http://saifmohammad.com/WebPages/lexicons.html",
         license = "License required for commercial use. Please contact Pierre.Charron@nrc-cnrc.gc.ca.",
         size = "22.8 MB",
         type = "lexicon",
         download_mech = "http",
         description = ""),
  ag_news =
    list(name = "AG News",
         url = "https://www.di.unipi.it/~gulli/AG_corpus_of_news_articles.html",
         license = "You are encouraged to download this corpus for any non-commercial use.",
         size = "64.4 MB",
         type = "dataset",
         download_mech = "https",
         description = ""),
  dbpedia =
    list(name = "DBpedia",
         url = "https://wiki.dbpedia.org/",
         license = "Creative Commons Attribution-ShareAlike 3.0 License",
         size = "279.5 MB",
         type = "dataset",
         download_mech = "https",
         description = ""),
  trec =
    list(name = "TREC-6 & TREC-50",
         url = "https://cogcomp.seas.upenn.edu/Data/QA/QC/",
         license = "Freely reusable public information licence",
         size = "1.2 MB",
         type = "dataset",
         download_mech = "https",
         description = ""),
  imdb =
    list(name = "IMDb Large Movie Review Dataset",
         url = "http://ai.stanford.edu/~amaas/data/sentiment/",
         license = "No license specified, the work may be protected by copyright.",
         size = "376.4 MB",
         type = "dataset",
         download_mech = "http",
         description = "")
)

#' Catalogue of all available data sources
#' @export
"catalogue"
catalogue <- Reduce(rbind, lapply(print_info, as.data.frame,
                                  stringsAsFactors = FALSE))
