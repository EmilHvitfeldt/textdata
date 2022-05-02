#' IMDB Large Movie Review Dataset
#'
#' The core dataset contains 50,000 reviews split evenly into 25k train and
#' 25k test sets. The overall distribution of labels is balanced (25k pos and
#' 25k neg).
#'
#' In the entire collection, no more than 30 reviews are allowed for any
#' given movie because reviews for the same movie tend to have correlated
#' ratings. Further, the train and test sets contain a disjoint set of
#' movies, so no significant performance is obtained by memorizing
#' movie-unique terms and their associated with observed labels. In the
#' labeled train/test sets, a negative review has a score <= 4 out of 10,
#' and a positive review has a score >= 7 out of 10. Thus reviews with
#' more neutral ratings are not included in the train/test sets. In the
#' unsupervised set, reviews of any rating are included and there are an
#' even number of reviews > 5 and <= 5.
#'
#' When using this dataset, please cite the ACL 2011 paper
#'
#' InProceedings\{maas-EtAl:2011:ACL-HLT2011, \cr
#' author    = \{Maas, Andrew L.  and  Daly, Raymond E.  and  Pham, Peter T.  and  Huang, Dan  and  Ng, Andrew Y.  and  Potts, Christopher\}, \cr
#' title     = \{Learning Word Vectors for Sentiment Analysis\}, \cr
#' booktitle = \{Proceedings of the 49th Annual Meeting of the Association for Computational Linguistics: Human Language Technologies\}, \cr
#' month     = \{June\}, \cr
#' year      = \{2011\}, \cr
#' address   = \{Portland, Oregon, USA\}, \cr
#' publisher = \{Association for Computational Linguistics\}, \cr
#' pages     = \{142--150\}, \cr
#' url       = \{http://www.aclweb.org/anthology/P11-1015\}
#' \}
#'
#' @source \url{http://ai.stanford.edu/~amaas/data/sentiment/}
#' @inheritParams lexicon_afinn
#' @param split Character. Return training ("train") data or testing ("test")
#'     data. Defaults to "train".
#' @return A tibble with 25,000 rows and 2 variables:
#' \describe{
#'   \item{Sentiment}{Character, denoting the sentiment}
#'   \item{text}{Character, text of the review}
#' }
#' @keywords datasets
#' @family topic sentiment
#' @export
#' @examples
#' \dontrun{
#' dataset_imdb()
#'
#' # Custom directory
#' dataset_imdb(dir = "data/")
#'
#' # Deleting dataset
#' dataset_imdb(delete = TRUE)
#'
#' # Returning filepath of data
#' dataset_imdb(return_path = TRUE)
#'
#' # Access both training and testing dataset
#' train <- dataset_imdb(split = "train")
#' test <- dataset_imdb(split = "test")
#' }
#'
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu untar
dataset_imdb <- function(dir = NULL, split = c("train", "test"),
                         delete = FALSE, return_path = FALSE, clean = FALSE,
                         manual_download = FALSE) {
  all_files <- paste0("imdb_", c("train", "test"), ".rds")
  split <- match.arg(split)
  name <- paste0("imdb_", split, ".rds")
  load_dataset(
    data_name = "imdb", name = name, dir = dir,
    delete = delete, return_path = return_path, clean = clean,
    clean_manual = all_files,
    manual_download = manual_download
  )
}

#' @importFrom utils download.file
download_imdb <- function(folder_path) {
  file_path <- path(folder_path, "imdb.tar.gz")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(
    url = "http://ai.stanford.edu/~amaas/data/sentiment/aclImdb_v1.tar.gz",
    destfile = file_path
  )
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
#' @importFrom fs dir_ls
#' @importFrom tibble tibble
process_imdb <- function(folder_path, name_path) {
  file_path_test <- path(folder_path, "imdb_csv/test.csv")
  file_path_train <- path(folder_path, "imdb_csv/train.csv")

  zip_path <- path(folder_path, "imdb.tar.gz")

  untar(zip_path, exdir = folder_path)

  files_test_neg <- dir_ls(path(folder_path, "aclimdb", "test", "neg"))
  files_test_pos <- dir_ls(path(folder_path, "aclimdb", "test", "pos"))

  data_test <- tibble(
    sentiment = rep(
      c("neg", "pos"),
      c(
        length(files_test_neg),
        length(files_test_pos)
      )
    ),
    text = c(
      vapply(files_test_neg, read_lines, character(1)),
      vapply(files_test_pos, read_lines, character(1))
    )
  )

  files_train_neg <- dir_ls(path(folder_path, "aclimdb", "train", "neg"))
  files_train_pos <- dir_ls(path(folder_path, "aclimdb", "train", "pos"))

  data_train <- tibble(
    sentiment = rep(
      c("neg", "pos"),
      c(
        length(files_train_neg),
        length(files_train_pos)
      )
    ),
    text = c(
      vapply(files_train_neg, read_lines, character(1)),
      vapply(files_train_pos, read_lines, character(1))
    )
  )

  write_rds(data_test, path(folder_path, "imdb_test.rds"))
  write_rds(data_train, path(folder_path, "imdb_train.rds"))
}
