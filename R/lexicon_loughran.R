#' Loughran-McDonald Sentiment Word Lists
#'
#' @param ... Additional arguments passed to \code{\link{load_dataset}}.
#' @return A tibble with 2 columns.
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
lexicon_loughran <- function(...) {
  load_dataset(data_name = "loughran", name = "LoughranMcDonald.rds", ...)
}

#' @importFrom utils download.file
#' @importFrom readr read_csv
download_loughran <- function(folder_path) {

  file_path <- path(folder_path,
                    "LoughranMcDonald_MasterDictionary_2018 - LoughranMcDonald_MasterDictionary_2018.csv")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "https://drive.google.com/uc?id=12ECPJMxV2wSalXG8ykMmkpa1fq_ur0Rf&export=download",
                destfile = file_path)
}

process_loughran <- function(folder_path, name_path) {
  data <- read_csv(path(folder_path, "LoughranMcDonald_MasterDictionary_2018 - LoughranMcDonald_MasterDictionary_2018.csv"))

  types <- c("Negative", "Positive", "Uncertainty", "Litigious", "Constraining", "Superfluous")

  out <- list()
  for (type in types) {
    out[[type]] <- tibble(word = tolower(as.character(data$Word[data[[type]] != 0])),
                          sentiment = tolower(type))
  }

  write_rds(Reduce(rbind, out), name_path)
}
