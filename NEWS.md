# textdata 0.4.4

* Update path to correctly path source for NRC lexicon.

# textdata 0.4.3

* Fixed documentation to be HTML5 friendly.

# textdata 0.4.2

* `cache_info()` function has to added to allow for quick overview of cacheing size.
* Update download url for `lexicon_nrc()`.

# textdata 0.4.1

# textdata 0.4.0

* `embedding_glove6b()`, `embedding_glove27b()`, `embedding_glove42b()`, and `embedding_glove840b()` have been added to give access to the Stanford NLP Global Vectors for Word Representations pre-trained word vectors (@jonthegeek, #26).
* `manual_download` argument have been added to all functions to allow the user to manual place file download at right place.

# textdata 0.3.0

*  `lexicon_nrc_eil()` has been added to give access to the NRC Emotion Intensity Lexicon (aka Affect Intensity Lexicon) v0.5.
*  `lexicon_nrc_vad()` has been added to give access to the The NRC Valence, Arousal, and Dominance Lexicon.
* The argument `clean` have been added to all functions to allow deletion of intermediate files.
* An optional information prompt is implemented. This will be turned off by default and turned on by original authors request.
* `dataset_nrc()` got improved url for faster and more reliable downloads.

# textdata 0.2.0

* `dataset_imdb()` has been added to give access to the IMDb Large Movie Review Dataset.
* `dataset_trec()` has been added to give access to the TREC-6 and TREC-50 classification datasets.
* `dataset_dbpedia()` has been added to give access to DBpedia Ontology classification dataset.
* `dataset_ag_news()` has been added to give access to AG's News Topic classification dataset.
* Functions will now notify the user about the download mechanism used to download the data. http/https etc. (#12).
* `lexicon_nrc()` has been added to give access to the  NRC Emotion lexicon (@juliasilge, #11).

# textdata 0.1.0
