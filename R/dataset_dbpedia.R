#' DBpedia Ontology Dataset
#'
#' DBpedia ontology dataset classification dataset. It contains 560,000 training
#' samples and 70,000 testing samples for each of 14 nonoverlapping classes
#' from DBpedia.
#'
#' The classes are
#'
#' \itemize{
#' \item Company
#' \item EducationalInstitution
#' \item Artist
#' \item Athlete
#' \item OfficeHolder
#' \item MeanOfTransportation
#' \item Building
#' \item NaturalPlace
#' \item Village
#' \item Animal
#' \item Plant
#' \item Album
#' \item Film
#' \item WrittenWork
#' }
#'
#' @source \url{https://papers.nips.cc/paper/5782-character-level-convolutional-networks-for-text-classification.pdf}
#' @source \url{https://wiki.dbpedia.org/}
#' @source \url{https://github.com/le-scientifique/torchDatasets/raw/master/dbpedia_csv.tar.gz}
#' @inheritParams lexicon_afinn
#' @param split Character. Return training ("train") data or testing ("test")
#'     data. Defaults to "train".
#' @return A tibble with 560,000 or 70,000 rows for "train" and "test"
#'     respectively and 3 variables:
#' \describe{
#'   \item{class}{Character, denoting the class class}
#'   \item{title}{Character, title of article}
#'   \item{description}{Character, description of article}
#' }
#' @keywords datasets
#' @family topic
#' @export
#' @examples
#' \donttest{
#' dataset_dbpedia()
#'
#' # Custom directory
#' dataset_dbpedia(dir = "data/")
#'
#' # Deleting dataset
#' dataset_dbpedia(delete = TRUE)
#'
#' # Returning filepath of data
#' dataset_dbpedia(return_path = TRUE)
#'
#' # Access both training and testing dataset
#' train <- dataset_dbpedia(split = "train")
#' test <- dataset_dbpedia(split = "test")
#' }
#'
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu untar
dataset_dbpedia <- function(dir = NULL, split = c("train", "test"),
                            delete = FALSE, return_path = FALSE,
                            clean = FALSE) {

  all_files <-  paste0("dbpedia_", c("train", "test"), ".rds")
  split <- match.arg(split)
  name <- paste0("dbpedia_", split, ".rds")
  load_dataset(data_name = "dbpedia", name = name, dir = dir,
               delete = delete, return_path = return_path, clean = clean,
               clean_manual = all_files)
}

#' @importFrom utils download.file
download_dbpedia <- function(folder_path) {
  file_path <- path(folder_path, "dbpedia_csv.tar.gz")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "https://github.com/le-scientifique/torchDatasets/raw/master/dbpedia_csv.tar.gz",
                destfile = file_path)
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
#' @importFrom tibble tibble
process_dbpedia <- function(folder_path, name_path) {

  file_path_test <- path(folder_path, "dbpedia_csv/test.csv")
  file_path_train <- path(folder_path, "dbpedia_csv/train.csv")

  zip_path <- path(folder_path, "dbpedia_csv.tar.gz")

  untar(zip_path, files = c("dbpedia_csv/test.csv",
                            "dbpedia_csv/train.csv"), exdir = folder_path)

  data_test <- read_csv(file_path_test, col_names = c("class", "title", "description"),
                        col_types = cols(
                          class = col_double(),
                          title = col_character(),
                          description = col_character()
                        ))
  data_train <- read_csv(file_path_train, col_names = c("class", "title", "description"),
                         col_types = cols(
                           class = col_double(),
                           title = col_character(),
                           description = col_character()
                         ))

  classes <- c("Company", "EducationalInstitution", "Artist", "Athlete",
               "OfficeHolder", "MeanOfTransportation", "Building",
               "NaturalPlace", "Village", "Animal", "Plant", "Album", "Film",
               "WrittenWork")

  data_test$class <- classes[data_test$class]
  data_train$class <- classes[data_train$class]

  write_rds(data_test, path(folder_path, "dbpedia_test.rds"))
  write_rds(data_train, path(folder_path, "dbpedia_train.rds"))

  fs::file_delete(path = file_path_test)
  fs::file_delete(path = file_path_train)
}
