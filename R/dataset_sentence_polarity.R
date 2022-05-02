#' v1.0 sentence polarity dataset
#'
#' 5331 positive and 5331 negative processed sentences / snippets.
#' Introduced in Pang/Lee ACL 2005. Released July 2005.
#'
#' Citation info:
#'
#' This data was first used in Bo Pang and Lillian Lee,
#' ``Seeing stars: Exploiting class relationships for sentiment categorization
#' with respect to rating scales.'', Proceedings of the ACL, 2005.
#'
#' InProceedings\{pang05, \cr
#' author    = \{Bo Pang and Lillian Lee\}, \cr
#' title     = \{Seeing stars: Exploiting class relationships for sentiment \cr
#'               categorization with respect to rating scales\}, \cr
#' booktitle = \{Proceedings of the ACL\}, \cr
#' year      = 2005 \cr
#' \}
#'
#' @inheritParams lexicon_afinn
#' @return A tibble with 10,662 rows and 2 variables:
#' \describe{
#'   \item{text}{Sentences or snippets}
#'   \item{sentiment}{Indicator for sentiment, "neg" for negative and "pos"
#'                    for positive}
#' }
#' @source \url{https://www.cs.cornell.edu/people/pabo/movie-review-data/}
#' @keywords datasets
#' @family sentiment
#' @export
#' @examples
#' \dontrun{
#' dataset_sentence_polarity()
#'
#' # Custom directory
#' dataset_sentence_polarity(dir = "data/")
#'
#' # Deleting dataset
#' dataset_sentence_polarity(delete = TRUE)
#'
#' # Returning filepath of data
#' dataset_sentence_polarity(return_path = TRUE)
#' }
#'
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
dataset_sentence_polarity <- function(dir = NULL, delete = FALSE,
                                      return_path = FALSE, clean = FALSE,
                                      manual_download = FALSE) {
  load_dataset(
    data_name = "sentence_polarity", name = "rt-polarity.rds",
    dir = dir, delete = delete, return_path = return_path,
    clean = clean, manual_download = manual_download
  )
}

#' @importFrom utils download.file
download_sentence_polarity <- function(folder_path) {
  file_path <- path(folder_path, "rt-polaritydata.tar.gz")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(
    url = "https://www.cs.cornell.edu/people/pabo/movie-review-data/rt-polaritydata.tar.gz",
    destfile = file_path
  )
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
#' @importFrom tibble tibble
process_sentence_polarity <- function(folder_path, name_path) {
  full_text <- read_lines(path(folder_path, "rt-polaritydata.tar.gz"))

  neq_text <- full_text[55:5385]
  neq_text[1] <- "simplistic , silly and tedious . "
  pos_text <- full_text[5386:10716]
  pos_text[1] <- "othe rock is destined to be the 21st century's new \" conan \" and that he's going to make a splash even greater than arnold schwarzenegger , jean-claud van damme or steven segal . "

  data <- tibble(
    text = c(neq_text, pos_text),
    sentiment = c(
      rep("neg", length(neq_text)),
      rep("pos", length(pos_text))
    )
  )
  write_rds(data, name_path)
}
