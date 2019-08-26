#' The NRC Valence, Arousal, and Dominance Lexicon
#'
#' The NRC Valence, Arousal, and Dominance (VAD) Lexicon includes a list of
#' more than 20,000 English words and their valence, arousal, and dominance
#' scores. For a given word and a dimension (V/A/D), the scores range from 0
#' (lowest V/A/D) to 1 (highest V/A/D). The lexicon with its fine-grained real-
#' valued scores was created by manual annotation using best--worst scaling.
#' The lexicon is markedly larger than any of the existing VAD lexicons. We also
#' show that the ratings obtained are substantially more reliable than those in
#' existing lexicons.
#'
#' License required for commercial use. Please contact Saif M. Mohammad
#' (saif.mohammad@nrc-cnrc.gc.ca).
#'
#' Citation info:
#'
#' Details of the NRC VAD Lexicon are available in this paper:
#'
#' Obtaining Reliable Human Ratings of Valence, Arousal, and Dominance for
#' 20,000 English Words.  Saif M. Mohammad. In Proceedings of the 56th Annual
#' Meeting of the Association for Computational Linguistics, Melbourne,
#' Australia, July 2018.
#'
#' inproceedings\{vad-acl2018, \cr
#' title=\{Obtaining Reliable Human Ratings of Valence, Arousal, and Dominance for 20,000 English Words\}, \cr
#' author=\{Mohammad, Saif M.\}, \cr
#' booktitle=\{Proceedings of The Annual Conference of the Association for Computational Linguistics (ACL)\}, \cr
#' year=\{2018\}, \cr
#' address=\{Melbourne, Australia\} \cr
#' \}
#'
#' @inheritParams lexicon_afinn
#' @return A tibble with 20.007 rows and 4 variables:
#' \describe{
#'   \item{word}{An English word}
#'   \item{Valence}{valence score of the word}
#'   \item{Arousal}{arousal score of the word}
#'   \item{Dominance}{dominance score of the word}
#' }
#'
#' @source \url{https://saifmohammad.com/WebPages/nrc-vad.html}
#' @keywords datasets
#' @family lexicon
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
#' @examples
#' \donttest{
#' lexicon_nrc_vad()
#'
#' # Custom directory
#' lexicon_nrc_vad(dir = "data/")
#'
#' # Deleting dataset
#' lexicon_nrc_vad(delete = TRUE)
#'
#' # Returning filepath of data
#' lexicon_nrc_vad(return_path = TRUE)
#' }
lexicon_nrc_vad <- function(dir = NULL, delete = FALSE, return_path = FALSE,
                            clean = FALSE) {
  load_dataset(data_name = "nrc_vad", name = "nrc_vad.rds",
               dir = dir,
               delete = delete,
               return_path = return_path, clean = clean)
}

#' @importFrom utils download.file
download_nrc_vad <- function(folder_path) {

  file_path <- path(folder_path,
                    "NRC-VAD-Lexicon-Aug2018Release.zip")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "http://saifmohammad.com/WebDocs/VAD/NRC-VAD-Lexicon-Aug2018Release.zip",
                destfile = file_path)
  unzip(path(folder_path, "NRC-VAD-Lexicon-Aug2018Release.zip"),
        exdir = folder_path)
}

#' @importFrom readr read_tsv
#' @importFrom utils unzip

process_nrc_vad <- function(folder_path, name_path) {

  data <- read_tsv(path(folder_path,
                        "NRC-VAD-Lexicon-Aug2018Release/NRC-VAD-Lexicon.txt"),
                   col_types = cols(
                     Word = col_character(),
                     Valence = col_double(),
                     Arousal = col_double(),
                     Dominance = col_double()
                   )
  )

  write_rds(data, name_path)
}
