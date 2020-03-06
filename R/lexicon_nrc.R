#' NRC word-emotion association lexicon
#'
#' General purpose English sentiment/emotion lexicon. This lexicon labels words
#' with six possible sentiments or emotions: "negative", "positive", "anger",
#' "anticipation", "disgust", "fear", "joy", "sadness", "surprise", or "trust".
#' The annotations were manually done through Amazon's Mechanical Turk.
#'
#' License required for commercial use. Please contact Saif M. Mohammad
#' (saif.mohammad@nrc-cnrc.gc.ca).
#'
#' Citation info:
#'
#' This dataset was published in Saif Mohammad and Peter Turney. (2013),
#' ``Crowdsourcing a Word-Emotion Association Lexicon.'' Computational
#' Intelligence, 29(3): 436-465.
#'
#' article\{mohammad13, \cr
#' author = \{Mohammad, Saif M. and Turney, Peter D.\}, \cr
#' title = \{CROWDSOURCING A WORD–EMOTION ASSOCIATION LEXICON\}, \cr
#' journal = \{Computational Intelligence\}, \cr
#' volume = \{29\}, \cr
#' number = \{3\}, \cr
#' pages = \{436-465\}, \cr
#' doi = \{10.1111/j.1467-8640.2012.00460.x\}, \cr
#' url = \{https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1467-8640.2012.00460.x\}, \cr
#' eprint = \{https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1467-8640.2012.00460.x\}, \cr
#' year = \{2013\} \cr
#' \}
#'
#'
#'
#' @inheritParams lexicon_afinn
#' @return A tibble with 13,901 rows and 2 variables:
#' \describe{
#'   \item{word}{An English word}
#'   \item{sentiment}{Indicator for sentiment or emotion: "negative",
#'   "positive", "anger", "anticipation", "disgust", "fear", "joy", "sadness",
#'   "surprise", or "trust"}
#' }
#'
#' @source \url{http://saifmohammad.com/WebPages/lexicons.html}
#' @keywords datasets
#' @family lexicon
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
#' @examples
#' \donttest{
#' lexicon_nrc()
#'
#' # Custom directory
#' lexicon_nrc(dir = "data/")
#'
#' # Deleting dataset
#' lexicon_nrc(delete = TRUE)
#'
#' # Returning filepath of data
#' lexicon_nrc(return_path = TRUE)
#' }
lexicon_nrc <- function(dir = NULL, delete = FALSE, return_path = FALSE,
                        clean = FALSE, manual_download = FALSE) {
  load_dataset(data_name = "nrc", name = "NRCWordEmotion.rds", dir = dir,
               delete = delete, return_path = return_path, clean = clean,
               manual_download = manual_download)
}

#' @importFrom utils download.file
download_nrc <- function(folder_path) {

  file_path <- path(folder_path,
                    "NRC-Emotion-Lexicon.zip")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "http://saifmohammad.com/WebDocs/NRC-Emotion-Lexicon.zip",
                destfile = file_path)
  unzip(path(folder_path, "NRC-Emotion-Lexicon.zip"),
        exdir = folder_path)
}

#' @importFrom readr read_tsv
#' @importFrom utils unzip

process_nrc <- function(folder_path, name_path) {

  data <- read_tsv(path(folder_path,
                        "NRC-Emotion-Lexicon/NRC-Emotion-Lexicon-v0.92/NRC-Emotion-Lexicon-Wordlevel-v0.92.txt"),
                   col_names = FALSE, col_types = cols(
                     X1 = col_character(),
                     X2 = col_character(),
                     X3 = col_double()
                   )
                   )

  data <- data[data$X3 == 1,]
  data <- tibble(word = data$X1,
                 sentiment = data$X2)

  write_rds(data, name_path)
}
