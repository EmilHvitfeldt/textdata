#' Bing Sentiment Lexicon
#'
#' @param ... Additional arguments passed to [load_dataset()].
#' @return A tibble with 2 columns.
#' @importFrom fs file_exists dir_exists dir_create
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
dataset_bing <- function(...) {
  load_dataset(data_name = "bing", name = "bing.rds", ...)
}


#' @importFrom utils download.file
#' @importFrom fs path
download_bing <- function(folder_path) {
  file_path_neg <- path(folder_path, "negative-words.txt")
  file_path_pos <- path(folder_path, "positive-words.txt")

  if (file_exists(file_path_pos) & file_exists(file_path_neg)) {
    return(invisible())
  }

  download.file(url = "http://ptrckprry.com/course/ssd/data/negative-words.txt",
                destfile = file_path_neg)
  download.file(url = "http://ptrckprry.com/course/ssd/data/positive-words.txt",
                destfile = file_path_pos)
}

#' @importFrom readr read_lines
process_bing <- function(folder_path, name_path) {
  file_path_neg <- path(folder_path, "negative-words.txt")
  file_path_pos <- path(folder_path, "positive-words.txt")

  neg_words <- read_lines(file_path_neg, skip = 35)
  pos_words <- read_lines(file_path_pos, skip = 35)

  data <- tibble(word = c(neg_words, pos_words),
                 sentiment = rep(c("negative", "positive"),
                                 c(length(neg_words), length(pos_words))))

  write_rds(data, name_path)
}
