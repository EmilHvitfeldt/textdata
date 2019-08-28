#' NRC Emotion Intensity Lexicon (aka Affect Intensity Lexicon) v0.5
#'
#' General purpose English sentiment/emotion lexicon. The NRC Affect Intensity
#' Lexicon is a list of English words and their associations with four basic
#' emotions (anger, fear, sadness, joy).
#'
#' For a given word and emotion X, the scores range from 0 to 1. A score of 1
#' means that the word conveys the highest amount of emotion X.  A score of 0
#' means that the word conveys the lowest amount of emotion X.
#'
#' License required for commercial use. Please contact Saif M. Mohammad
#' (saif.mohammad@nrc-cnrc.gc.ca).
#'
#' Citation info:
#'
#' Details of the lexicon are in this paper.
#' Word Affect Intensities. Saif M. Mohammad. In Proceedings of the 11th Edition
#' of the Language Resources and Evaluation Conference (LREC-2018), May 2018,
#' Miyazaki, Japan.
#'
#' inproceedings\{LREC18-AIL, \cr
#' author = \{Mohammad, Saif M.\}, \cr
#' title = \{Word Affect Intensities\}, \cr
#' booktitle = \{Proceedings of the 11th Edition of the Language Resources and Evaluation Conference (LREC-2018)\}, \cr
#' year = \{2018\}, \cr
#' address=\{Miyazaki, Japan\} \cr
#' \} \cr
#'
#' @inheritParams lexicon_afinn
#' @return A tibble with 5.814 rows and 3 variables:
#' \describe{
#'   \item{term}{An English word}
#'   \item{score}{Value between 0 and 1}
#'   \item{AffectDimension}{Indicator for sentiment or emotion: ("anger",
#'                          "fear", "sadness", "joy")}
#' }
#'
#' @source \url{https://saifmohammad.com/WebPages/AffectIntensity.htm}
#' @keywords datasets
#' @family lexicon
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
#' @examples
#' \donttest{
#' lexicon_nrc_eil()
#'
#' # Custom directory
#' lexicon_nrc_eil(dir = "data/")
#'
#' # Deleting dataset
#' lexicon_nrc_eil(delete = TRUE)
#'
#' # Returning filepath of data
#' lexicon_nrc_eil(return_path = TRUE)
#' }
lexicon_nrc_eil <- function(dir = NULL, delete = FALSE, return_path = FALSE,
                            clean = FALSE) {
  load_dataset(data_name = "nrc_eil", name = "nrc_eil.rds",
               dir = dir,
               delete = delete,
               return_path = return_path, clean = clean)
}

#' @importFrom utils download.file
download_nrc_eil <- function(folder_path) {

  file_path <- path(folder_path,
                    "NRC-AffectIntensity-Lexicon.txt")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "http://saifmohammad.com/WebDocs/NRC-AffectIntensity-Lexicon.txt",
                destfile = file_path)
}

#' @importFrom readr read_tsv
#' @importFrom utils unzip

process_nrc_eil <- function(folder_path, name_path) {

  data <- read_tsv(file = path(folder_path, "NRC-AffectIntensity-Lexicon.txt"),
                   skip = 36,
                   col_types = cols(
    term = col_character(),
    score = col_double(),
    AffectDimension = col_character()
  ))
  write_rds(data, name_path)
}
