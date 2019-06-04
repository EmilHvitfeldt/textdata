#' AFINN-111 dataset
#'
#' AFINN is a list of English words rated for valence with an integer
#' between minus five (negative) and plus five (positive). The words have
#' been manually labeled by Finn Årup Nielsen in 2009-2011.
#'
#' This dataset is the newest version with 2477 words and phrases.
#'
#' @param ... Additional arguments passed to [load_dataset()].
#' @return A tibble with 2 columns.
#' @importFrom fs file_exists dir_exists dir_create
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
dataset_afinn <- function(...) {
  load_dataset(data_name = "afinn", name = "afinn_111.rds", ...)
}

#' @importFrom utils download.file
download_afinn <- function(folder_path) {
  file_path <- paste0(folder_path, "imm6010.zip", collapse = "")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "https://www2.imm.dtu.dk/pubdb/views/edoc_download.php/6010/zip/imm6010.zip",
                destfile = file_path)
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
process_afinn <- function(folder_path, name_path) {
  data <- read_tsv(unz(paste0(folder_path, "imm6010.zip", collapse = ""),
                       "AFINN/AFINN-111.txt"),
                   col_types = cols(
                     word = col_character(),
                     value = col_double()
                   ),
                   col_names = c("word", "value"))
  write_rds(data, name_path)
}
