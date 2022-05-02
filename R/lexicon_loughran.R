#' Loughran-McDonald sentiment lexicon
#'
#' English sentiment lexicon created for use with financial documents. This
#' lexicon labels words with six possible sentiments important in financial
#' contexts: "negative", "positive", "litigious", "uncertainty", "constraining",
#' or "superfluous".
#'
#' Citation info:
#'
#' This dataset was published in Loughran, T. and McDonald, B. (2011),
#' ``When Is a Liability Not a Liability? Textual Analysis, Dictionaries, and
#' 10-Ks.'' The Journal of Finance, 66: 35-65.
#'
#' article\{loughran11, \cr
#' author  = \{Loughran, Tim and McDonald, Bill\}, \cr
#' title   = \{When Is a Liability Not a Liability? Textual Analysis, Dictionaries, and 10-Ks\}, \cr
#' journal = \{The Journal of Finance\}, \cr
#' volume  = \{66\}, \cr
#' number  = \{1\}, \cr
#' pages   = \{35-65\}, \cr
#' doi     = \{10.1111/j.1540-6261.2010.01625.x\}, \cr
#' url     = \{https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1540-6261.2010.01625.x\}, \cr
#' eprint  = \{https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1540-6261.2010.01625.x\}, \cr
#' year    = \{2011\} \cr
#' \}
#'
#'
#' @inheritParams lexicon_afinn
#' @return A tibble with 4,150 rows and 2 variables:
#' \describe{
#'   \item{word}{An English word}
#'   \item{sentiment}{Indicator for sentiment: "negative", "positive",
#'   "litigious", "uncertainty", "constraining", or "superfluous"}
#' }
#'
#' @source \url{https://sraf.nd.edu/loughranmcdonald-master-dictionary/}
#' @keywords datasets
#' @family lexicon
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
#' @examples
#' \dontrun{
#' lexicon_loughran()
#'
#' # Custom directory
#' lexicon_loughran(dir = "data/")
#'
#' # Deleting dataset
#' lexicon_loughran(delete = TRUE)
#'
#' # Returning filepath of data
#' lexicon_loughran(return_path = TRUE)
#' }
lexicon_loughran <- function(dir = NULL, delete = FALSE, return_path = FALSE,
                             clean = FALSE, manual_download = FALSE) {
  load_dataset(
    data_name = "loughran", name = "LoughranMcDonald.rds", dir = dir,
    delete = delete, return_path = return_path, clean = clean,
    manual_download = manual_download
  )
}

#' @importFrom utils download.file
download_loughran <- function(folder_path) {
  file_path <- path(
    folder_path,
    "LoughranMcDonald_MasterDictionary_2018 - LoughranMcDonald_MasterDictionary_2018.csv"
  )
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(
    url = "https://drive.google.com/uc?id=12ECPJMxV2wSalXG8ykMmkpa1fq_ur0Rf&export=download",
    destfile = file_path
  )
}
#' @importFrom readr read_csv cols_only col_character col_double
process_loughran <- function(folder_path, name_path) {
  data <- read_csv(path(folder_path, "LoughranMcDonald_MasterDictionary_2018 - LoughranMcDonald_MasterDictionary_2018.csv"),
    col_types = cols_only(
      Word = col_character(),
      Negative = col_double(),
      Positive = col_double(),
      Uncertainty = col_double(),
      Litigious = col_double(),
      Constraining = col_double(),
      Superfluous = col_double()
    )
  )

  types <- c("Negative", "Positive", "Uncertainty", "Litigious", "Constraining", "Superfluous")

  out <- list()
  for (type in types) {
    out[[type]] <- tibble(
      word = tolower(as.character(data$Word[data[[type]] != 0])),
      sentiment = tolower(type)
    )
  }

  write_rds(Reduce(rbind, out), name_path)
}
