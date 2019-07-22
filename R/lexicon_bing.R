#' Bing sentiment lexicon
#'
#' General purpose English sentiment lexicon that categorizes words in a
#' binary fashion, either positive or negative
#'
#' Citation info:
#'
#' This dataset was first published in Minqing Hu and Bing Liu, ``Mining and
#' summarizing customer reviews.'', Proceedings of the ACM SIGKDD International
#' Conference on Knowledge Discovery & Data Mining (KDD-2004), 2004.
#'
#' inproceedings\{Hu04, \cr
#' author    = \{Hu, Minqing and Liu, Bing\}, \cr
#' title     = \{Mining and Summarizing Customer Reviews\}, \cr
#' booktitle = \{Proceedings of the Tenth ACM SIGKDD International Conference
#'               on Knowledge Discovery and Data Mining\}, \cr
#' series    = \{KDD '04\}, \cr
#' year      = \{2004\}, \cr
#' isbn      = \{1-58113-888-1\}, \cr
#' location  = \{Seattle, WA, USA\}, \cr
#' pages     = \{168--177\}, \cr
#' numpages  = \{10\}, \cr
#' url       = \{http://doi.acm.org/10.1145/1014052.1014073\}, \cr
#' doi       = \{10.1145/1014052.1014073\}, \cr
#' acmid     = \{1014073\}, \cr
#' publisher = \{ACM\}, \cr
#' address   = \{New York, NY, USA\}, \cr
#' keywords  = \{reviews, sentiment classification, summarization, text mining\}, \cr
#' \}
#'
#' @inheritParams lexicon_afinn
#' @return A tibble with 6,787 rows and 2 variables:
#' \describe{
#'   \item{word}{An English word}
#'   \item{sentiment}{Indicator for sentiment: "negative" or "positive"}
#' }
#'
#' @source \url{https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html}
#' @keywords datasets
#' @family lexicon
#' @importFrom fs file_exists dir_exists dir_create
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
#' @examples
#' \donttest{
#' lexicon_bing()
#'
#' # Custom directory
#' lexicon_bing(dir = "data/")
#'
#' # Deleting dataset
#' lexicon_bing(delete = TRUE)
#'
#' # Returning filepath of data
#' lexicon_bing(return_path = TRUE)
#' }
lexicon_bing <- function(dir = NULL, delete = FALSE, return_path = FALSE) {
  load_dataset(data_name = "bing", name = "bing.rds", dir = dir,
               delete = delete, return_path = return_path)
}


#' @importFrom utils download.file
#' @importFrom fs path
download_bing <- function(folder_path) {
  file_path_neg <- path(folder_path, "negative-words.txt")
  file_path_pos <- path(folder_path, "positive-words.txt")

  if (file_exists(file_path_pos) & file_exists(file_path_neg)) {
    return(invisible())
  }

  download.file(url = "http://ptrckprry.com/course/ssd/data/negative-words.txt",
                destfile = file_path_neg)
  download.file(url = "http://ptrckprry.com/course/ssd/data/positive-words.txt",
                destfile = file_path_pos)
}

#' @importFrom readr read_lines
process_bing <- function(folder_path, name_path) {
  file_path_neg <- path(folder_path, "negative-words.txt")
  file_path_pos <- path(folder_path, "positive-words.txt")

  neg_words <- read_lines(file_path_neg, skip = 35)
  pos_words <- read_lines(file_path_pos, skip = 35)

  data <- tibble(word = c(neg_words, pos_words),
                 sentiment = rep(c("negative", "positive"),
                                 c(length(neg_words), length(pos_words))))

  write_rds(data, name_path)
}
