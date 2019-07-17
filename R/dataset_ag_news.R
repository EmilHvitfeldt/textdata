#' AG's News Topic Classification Dataset
#'
#' The AG's news topic classification dataset is constructed by choosing 4
#' largest classes from the original corpus. Each class contains 30,000 training
#' samples and 1,900 testing samples. The total number of training samples is
#' 120,000 and testing 7,600.

#' Version 3, Updated 09/09/2015
#'
#' The index variable refer to the following news classes
#'
#' 1 - World
#' 2 - Sports
#' 3 - Business
#' 4 - Sci/Tech
#'
#' @inheritParams lexicon_afinn
#' @param split Character. Return training ("train") data or testing ("test")
#'     data. Defaults to "train".
#' @return A tibble with 120,000 or 30,000 rows for "train" and "test"
#'     respectively and 3 variables:
#' \describe{
#'   \item{index}{Integers denoting new class}
#'   \item{title}{Character, title of article}
#'   \item{description}{Character, description of article}
#' }
#' @source \url{http://www.di.unipi.it/~gulli/AG_corpus_of_news_articles.html}
#' @source \url{https://github.com/mhjabreel/CharCnn_Keras/tree/master/data/ag_news_csv}
#' @keywords datasets
#' @export
#' @examples
#' \donttest{
#' dataset_ag_news()
#'
#' # Custom directory
#' dataset_ag_news(dir = "data/")
#'
#' # Deleting dataset
#' dataset_ag_news(delete = TRUE)
#'
#' # Returning filepath of data
#' dataset_ag_news(return_path = TRUE)
#'
#' # Access both training and testing dataset
#' train <- dataset_ag_news(split = "train")
#' test <- dataset_ag_news(split = "test")
#' }
#'
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
dataset_ag_news <- function(dir = NULL, split = c("train", "test"),
                                      delete = FALSE, return_path = FALSE) {

  split <- match.arg(split)
  name <- paste0("ag_news_", split, ".rds")
  load_dataset(data_name = "ag_news", name = name, dir = dir,
               delete = delete, return_path = return_path)
}

#' @importFrom utils download.file
download_ag_news <- function(folder_path) {
  file_path <- path(folder_path, "rt-polaritydata.tar.gz")

  file_path_test <- path(folder_path, "ag_news_test.csv")
  file_path_train <- path(folder_path, "ag_news_train.csv")

  if (file_exists(file_path_test) & file_exists(file_path_train)) {
    return(invisible())
  }

  download.file(url = "https://raw.githubusercontent.com/mhjabreel/CharCnn_Keras/master/data/ag_news_csv/test.csv",
                destfile = file_path_test)
  download.file(url = "https://raw.githubusercontent.com/mhjabreel/CharCnn_Keras/master/data/ag_news_csv/train.csv",
                destfile = file_path_train)
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
#' @importFrom tibble tibble
process_ag_news <- function(folder_path, name_path) {

  file_path_test <- path(folder_path, "ag_news_test.csv")
  file_path_train <- path(folder_path, "ag_news_train.csv")

  data_test <- read_csv(file_path_test, col_names = c("index", "title", "description"),
                        col_types = cols(
                          index = col_double(),
                          title = col_character(),
                          description = col_character()
                        ))
  data_train <- read_csv(file_path_train, col_names = c("index", "title", "description"),
                         col_types = cols(
                           index = col_double(),
                           title = col_character(),
                           description = col_character()
                         ))

  write_rds(data_test, path(folder_path, "ag_news_test.rds"))
  write_rds(data_train, path(folder_path, "ag_news_train.rds"))
}