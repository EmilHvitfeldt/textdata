print_info <- list(
  afinn =
    list(name = "AFINN-111",
         url = "http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010",
         license = "Open Database License (ODbL) v1.0",
         size = "78 KB (cleaned 59 KB)",
         type = "lexicon",
         download_mech = "https",
         description = "",
         citation = NA),
  sentence_polarity =
    list(name = "v1.0 sentence polarity",
         url = "http://www.cs.cornell.edu/people/pabo/movie-review-data",
         license = "Cite the paper when used.",
         size = "2 MB (cleaned 1.4 MB)",
         type = "dataset",
         download_mech = "https",
         description = "Dataset with sentences labeled with negative or positive sentiment.",
         citation = NA),
  loughran =
    list(name = "Loughran-McDonald Sentiment lexicon",
         url = "https://sraf.nd.edu/textual-analysis/resources/",
         license = "License required for commercial use. Please contact tloughra@nd.edu.",
         size = "6.7 MB (cleaned 142 KB)",
         type = "lexicon",
         download_mech = "https",
         description = "",
         citation = NA),
  bing =
    list(name = "Bing Sentiment Lexicon",
         url = "https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html",
         license = "May be used (research, commercial, etc) with attribution.",
         size = "287 KB (cleaned 220 KB)",
         type = "lexicon",
         download_mech = "http",
         description = "",
         citation = NA),
  nrc =
    list(name = "NRC Word-Emotion Association Lexicon",
         url = "http://saifmohammad.com/WebPages/lexicons.html",
         license = "License required for commercial use. Please contact Saif M. Mohammad (saif.mohammad@nrc-cnrc.gc.ca).",
         size = "22.8 MB (cleaned 424 KB)",
         type = "lexicon",
         download_mech = "http",
         description = "",
         citation = "Citation info:

This dataset was published in Saif M. Mohammad and Peter Turney. (2013), ``Crowdsourcing a Word-Emotion Association Lexicon.'' Computational Intelligence, 29(3): 436-465.

article{mohammad13,
author = {Mohammad, Saif M. and Turney, Peter D.},
title = {Crowdsourcing a Word-Emotion Association Lexicon},
journal = {Computational Intelligence},
volume = {29},
number = {3},
pages = {436-465},
doi = {10.1111/j.1467-8640.2012.00460.x},
url = {https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1467-8640.2012.00460.x},
eprint = {https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1467-8640.2012.00460.x},
year = {2013}
}
If you use this lexicon, then please cite it."),
  nrc_eil =
    list(name = "NRC Emotion Intensity Lexicon (aka Affect Intensity Lexicon)",
         url = "www.saifmohammad.com/WebPages/AffectIntensity.htm",
         license = "License required for commercial use. Please contact Saif M. Mohammad (saif.mohammad@nrc-cnrc.gc.ca).",
         size = "333 KB (cleaned 212 KB)",
         type = "lexicon",
         download_mech = "http",
         description = "",
         citation = "Citation info:
Details of the lexicon are in this paper.
Word Affect Intensities. Saif M. Mohammad. arXiv preprint arXiv, April 2017.

inproceedings{LREC18-AIL,
author = {Mohammad, Saif M.},
title = {Word Affect Intensities},
booktitle = {Proceedings of the 11th Edition of the Language Resources and Evaluation Conference (LREC-2018)},
year = {2018},
address={Miyazaki, Japan}
}

If you use this lexicon, then please cite it."),
  nrc_vad =
    list(name = "The NRC Valence, Arousal, and Dominance Lexicon",
         url = "https://saifmohammad.com/WebPages/nrc-vad.html",
         license = "License required for commercial use. Please contact Saif M. Mohammad (saif.mohammad@nrc-cnrc.gc.ca).",
         size = "150.8 MB (cleaned 792 KB)",
         type = "lexicon",
         download_mech = "http",
         description = "",
         citation = "Citation info:

inproceedings{vad-acl2018,
title={Obtaining Reliable Human Ratings of Valence, Arousal, and Dominance for 20,000 English Words},
author={Mohammad, Saif M.},
booktitle={Proceedings of The Annual Conference of the Association for Computational Linguistics (ACL)},
year={2018},
address={Melbourne, Australia}
}

If you use this lexicon, then please cite it."),
  ag_news =
    list(name = "AG News",
         url = "https://www.di.unipi.it/~gulli/AG_corpus_of_news_articles.html",
         license = "You are encouraged to download this corpus for any non-commercial use.",
         size = "64.4 MB (cleaned 33.9 MB)",
         type = "dataset",
         download_mech = "https",
         description = "",
         citation = NA),
  dbpedia =
    list(name = "DBpedia",
         url = "https://wiki.dbpedia.org/",
         license = "Creative Commons Attribution-ShareAlike 3.0 License",
         size = "279.5 MB (cleaned 211.1 MB)",
         type = "dataset",
         download_mech = "https",
         description = "",
         citation = NA),
  trec =
    list(name = "TREC-6 & TREC-50",
         url = "https://cogcomp.seas.upenn.edu/Data/QA/QC/",
         license = "Freely reusable public information licence",
         size = "1.2 MB (cleaned 827 KB)",
         type = "dataset",
         download_mech = "https",
         description = "",
         citation = NA),
  imdb =
    list(name = "IMDb Large Movie Review Dataset",
         url = "http://ai.stanford.edu/~amaas/data/sentiment/",
         license = "No license specified, the work may be protected by copyright.",
         size = "376.4 MB (cleaned 71 MB)",
         type = "dataset",
         download_mech = "http",
         description = "",
         citation = NA),
  glove6b =
    list(name = "GloVe 6B",
         url = "https://nlp.stanford.edu/projects/glove/",
         license = "Public Domain Dedication and License v1.0",
         size = "822.2 MB (158MB, 311MB, 616MB, and 921MB processed)",
         type = "embeddings",
         download_mech = "https",
         description = "Wikipedia 2014 + Gigaword 5 (6B tokens, 400K vocab, uncased, 50d, 100d, 200d, & 300d vectors)",
         citation = "Citation info:
inproceedings{pennington2014glove,
author = {Jeffrey Pennington and Richard Socher and Christopher D. Manning},
booktitle = {Empirical Methods in Natural Language Processing (EMNLP)},
title = {GloVe: Global Vectors for Word Representation},
year = {2014},
pages = {1532--1543},
url = {http://www.aclweb.org/anthology/D14-1162},
}"
    ),
  glove27b =
    list(name = "GloVe Twitter 27B",
         url = "https://nlp.stanford.edu/projects/glove/",
         license = "Public Domain Dedication and License v1.0",
         size = "1.42 GB (248MB, 476MB, 931MB, and 1.79GB processed)",
         type = "embeddings",
         download_mech = "https",
         description = "Twitter (2B tweets, 27B tokens, 1.2M vocab, uncased, 25d, 50d, 100d, & 200d vectors)",
         citation = "Citation info:
inproceedings{pennington2014glove,
author = {Jeffrey Pennington and Richard Socher and Christopher D. Manning},
booktitle = {Empirical Methods in Natural Language Processing (EMNLP)},
title = {GloVe: Global Vectors for Word Representation},
year = {2014},
pages = {1532--1543},
url = {http://www.aclweb.org/anthology/D14-1162},
}"
    ),
  glove42b =
    list(name = "GloVe Common Crawl 42B",
         url = "https://nlp.stanford.edu/projects/glove/",
         license = "Public Domain Dedication and License v1.0",
         size = "1.75 GB (4.31GB processed)",
         type = "embeddings",
         download_mech = "https",
         description = "Common Crawl (42B tokens, 1.9M vocab, uncased, 300d vectors)",
         citation = "Citation info:
inproceedings{pennington2014glove,
author = {Jeffrey Pennington and Richard Socher and Christopher D. Manning},
booktitle = {Empirical Methods in Natural Language Processing (EMNLP)},
title = {GloVe: Global Vectors for Word Representation},
year = {2014},
pages = {1532--1543},
url = {http://www.aclweb.org/anthology/D14-1162},
}"
    ),
  glove840b =
    list(name = "GloVe Common Crawl 840B",
         url = "https://nlp.stanford.edu/projects/glove/",
         license = "Public Domain Dedication and License v1.0",
         size = "2.03 GB (4.94GB processed)",
         type = "embeddings",
         download_mech = "https",
         description = "Common Crawl (840B tokens, 2.2M vocab, cased, 300d vectors)",
         citation = "Citation info:
inproceedings{pennington2014glove,
author = {Jeffrey Pennington and Richard Socher and Christopher D. Manning},
booktitle = {Empirical Methods in Natural Language Processing (EMNLP)},
title = {GloVe: Global Vectors for Word Representation},
year = {2014},
pages = {1532--1543},
url = {http://www.aclweb.org/anthology/D14-1162},
}"
    )
)

#' Catalogue of all available data sources
#' @export
"catalogue"
catalogue <- Reduce(rbind, lapply(print_info, as.data.frame,
                                  stringsAsFactors = FALSE))
