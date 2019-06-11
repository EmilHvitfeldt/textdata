#' AFINN-111 dataset
#'
#' AFINN is a lexicon of English words rated for valence with an integer
#' between minus five (negative) and plus five (positive). The words have
#' been manually labeled by Finn Årup Nielsen in 2009-2011.
#'
#' This dataset is the newest version with 2477 words and phrases.
#'
#' Citation info:
#'
#' This dataset was published in Finn Ärup Nielsen (2011),
#' ``A new {ANEW:} Evaluation of a word list for sentiment analysis in
#' microblogs'', Proceedings of the ESWC2011 Workshop on
#' 'Making Sense of Microposts': Big things come in small packages (2011) 93-98.
#'
#' article\{nielsen11, \cr
#' author    = \{Finn Äruprup Nielsen\}, \cr
#' title     = \{A new {ANEW:} Evaluation of a word list for sentiment analysis in microblogs\}, \cr
#' journal   = \{CoRR\}, \cr
#' volume    = \{abs/1103.2903\}, \cr
#' year      = \{2011\}, \cr
#' url       = \{http://arxiv.org/abs/1103.2903\}, \cr
#' archivePrefix = \{arXiv\}, \cr
#' eprint    = \{1103.2903\}, \cr
#' biburl    = \{https://dblp.org/rec/bib/journals/corr/abs-1103-2903\}, \cr
#' bibsource = \{dblp computer science bibliography, https://dblp.org\} \cr
#' \}
#'
#' @param dir Character, path to directory where data will be stored. If
#'     \code{NULL}, \link[rappdirs]{user_cache_dir} will be used to determine path.
#' @param delete Logical, set \code{TRUE} to delete dataset.
#' @param return_path Logical, set \code{TRUE} to return the path of the dataset.
#' @return A tibble with 2,477 rows and 2 variables:
#' \describe{
#'   \item{word}{An English word}
#'   \item{sentiment}{Indicator for sentiment: integer between -5 and +5}
#' }
#'
#' @keywords datasets
#' @importFrom fs file_exists dir_exists dir_create
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
#' @examples
#' \donttest{
#' lexicon_afinn()
#'
#' # Custom directory
#' lexicon_afinn(dir = "data/")
#'
#' # Deleting dataset
#' lexicon_afinn(delete = TRUE)
#'
#' # Returning filepath of data
#' lexicon_afinn(return_path = TRUE)
#' }
lexicon_afinn <- function(dir = NULL, delete = FALSE, return_path = FALSE) {
  load_dataset(data_name = "afinn", name = "afinn_111.rds", dir = dir,
               delete = delete, return_path = return_path)
}

#' @importFrom utils download.file
download_afinn <- function(folder_path) {
  file_path <- path(folder_path, "imm6010.zip")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "https://www2.imm.dtu.dk/pubdb/views/edoc_download.php/6010/zip/imm6010.zip",
                destfile = file_path)
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
process_afinn <- function(folder_path, name_path) {
  file <- unz(path(folder_path, "imm6010.zip"), "AFINN/AFINN-111.txt")
  data <- read_tsv(file,
                   col_types = cols(
                     word = col_character(),
                     value = col_double()
                   ),
                   col_names = c("word", "value"))
  write_rds(data, name_path)
}
