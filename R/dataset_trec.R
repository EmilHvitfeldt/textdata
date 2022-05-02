#' TREC dataset
#'
#' The TREC dataset is dataset for question classification consisting of
#' open-domain, fact-based questions divided into broad semantic categories.
#' It has both a six-class (TREC-6) and a fifty-class (TREC-50) version. Both
#' have 5,452 training examples and 500 test examples, but TREC-50 has
#' finer-grained labels. Models are evaluated based on accuracy.
#'
#' The classes in TREC-6 are
#'
#' \itemize{
#' \item ABBR - Abbreviation
#' \item DESC - Description and abstract concepts
#' \item ENTY - Entities
#' \item HUM - Human beings
#' \item LOC - Locations
#' \item NYM - Numeric values
#' }
#'
#' the classes in TREC-50 can be found here
#' \url{https://cogcomp.seas.upenn.edu/Data/QA/QC/definition.html}.
#'
#' @source \url{https://cogcomp.seas.upenn.edu/Data/QA/QC/}
#' @source \url{https://trec.nist.gov/data/qa.html}
#' @inheritParams lexicon_afinn
#' @param split Character. Return training ("train") data or testing ("test")
#'     data. Defaults to "train".
#' @param version Character. Version 6("6") or version 50("50"). Defaults to
#'     "6".
#' @return A tibble with 5,452 or 500 rows for "train" and "test"
#'     respectively and 2 variables:
#' \describe{
#'   \item{class}{Character, denoting the class}
#'   \item{text}{Character, question text}
#' }
#' @keywords datasets
#' @family topic
#' @export
#' @examples
#' \dontrun{
#' dataset_trec()
#'
#' # Custom directory
#' dataset_trec(dir = "data/")
#'
#' # Deleting dataset
#' dataset_trec(delete = TRUE)
#'
#' # Returning filepath of data
#' dataset_trec(return_path = TRUE)
#'
#' # Access both training and testing dataset
#' train_6 <- dataset_trec(split = "train")
#' test_6 <- dataset_trec(split = "test")
#'
#' train_50 <- dataset_trec(split = "train", version = "50")
#' test_50 <- dataset_trec(split = "test", version = "50")
#' }
#'
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu untar
dataset_trec <- function(dir = NULL, split = c("train", "test"),
                         version = c("6", "50"), delete = FALSE,
                         return_path = FALSE, clean = FALSE,
                         manual_download = FALSE) {
  all_files <- paste0(
    "trec_", rep(c("6", "50"), 2), "_",
    rep(c("train", "test"), each = 2), ".rds"
  )
  split <- match.arg(split)
  version <- match.arg(version)
  name <- paste0("trec_", version, "_", split, ".rds")
  load_dataset(
    data_name = "trec", name = name, dir = dir,
    delete = delete, return_path = return_path, clean = clean,
    clean_manual = all_files,
    manual_download = manual_download
  )
}

#' @importFrom utils download.file
download_trec <- function(folder_path) {
  file_path_train <- path(folder_path, "train_5500.label")
  file_path_test <- path(folder_path, "TREC_10.label")

  if (file_exists(file_path_train) & file_exists(file_path_test)) {
    return(invisible())
  }
  download.file(
    url = "https://cogcomp.seas.upenn.edu/Data/QA/QC/train_5500.label",
    destfile = file_path_train
  )
  download.file(
    url = "https://cogcomp.seas.upenn.edu/Data/QA/QC/TREC_10.label",
    destfile = file_path_test
  )
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
#' @importFrom tibble tibble
process_trec <- function(folder_path, name_path) {
  file_path_train <- path(folder_path, "train_5500.label")
  file_path_test <- path(folder_path, "TREC_10.label")

  # Test data
  data_test <- read_lines(file_path_test)

  text_test <- gsub("^\\S* ", "", data_test)

  label_test <- sub("\\s.*", "", data_test)

  trec6_label_test <- sapply(strsplit(label_test, ":"), function(x) x[1])
  trec50_label_test <- sapply(strsplit(label_test, ":"), function(x) x[2])

  trec_6_test <- tibble(
    class = trec6_label_test,
    text = text_test
  )
  trec_50_test <- tibble(
    class = trec50_label_test,
    text = text_test
  )
  # train data
  data_train <- read_lines(file_path_train)

  text_train <- gsub("^\\S* ", "", data_train)

  label_train <- sub("\\s.*", "", data_train)

  trec6_label_train <- sapply(strsplit(label_train, ":"), function(x) x[1])
  trec50_label_train <- sapply(strsplit(label_train, ":"), function(x) x[2])

  trec_6_train <- tibble(
    class = trec6_label_train,
    text = text_train
  )
  trec_50_train <- tibble(
    class = trec50_label_train,
    text = text_train
  )

  write_rds(trec_6_test, path(folder_path, "trec_6_test.rds"))
  write_rds(trec_6_train, path(folder_path, "trec_6_train.rds"))

  write_rds(trec_50_test, path(folder_path, "trec_50_test.rds"))
  write_rds(trec_50_train, path(folder_path, "trec_50_train.rds"))
}
