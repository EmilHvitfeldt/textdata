#' v1.0 sentence polarity dataset
#'
#' 5331 positive and 5331 negative processed sentences / snippets.
#' Introduced in Pang/Lee ACL 2005. Released July 2005.
#'
#' @param ... Additional arguments passed to [load_dataset()].
#' @return A tibble with 2 columns.
#' @importFrom fs file_exists dir_exists dir_create
#' @importFrom readr read_rds
#' @importFrom utils menu
#' @export
dataset_sentence_polarity <- function(...) {
  load_dataset(data_name = "sentence_polarity", name = "rt-polarity.rds", ...)
}

#' @importFrom utils download.file
download_sentence_polarity <- function(folder_path) {
  file_path <- paste0(folder_path, "rt-polaritydata.tar.gz", collapse = "")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(url = "http://www.cs.cornell.edu/people/pabo/movie-review-data/rt-polaritydata.tar.gz",
                destfile = file_path)
}

#' @importFrom readr read_tsv write_rds cols col_character col_double
#' @importFrom tibble tibble
process_sentence_polarity <- function(folder_path, name_path) {

  con <- gzfile(paste0(folder_path, "rt-polaritydata.tar.gz", collapse = ""))

  full_text <- readLines(con, skipNul = TRUE)

  close(con)

  neq_text <- full_text[55:5385]
  neq_text[1] <- "simplistic , silly and tedious . "
  pos_text <- full_text[5386:10716]
  pos_text[1] <- "othe rock is destined to be the 21st century's new \" conan \" and that he's going to make a splash even greater than arnold schwarzenegger , jean-claud van damme or steven segal . "

  data <- tibble(text = c(neq_text, pos_text),
                 sentiment = c(rep("neg", length(neq_text)),
                               rep("pos", length(pos_text))))
  write_rds(data, name_path)
}
