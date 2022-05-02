#' Global Vectors for Word Representation
#'
#' The GloVe pre-trained word vectors provide word embeddings created using
#' varying numbers of tokens.
#'
#' Citation info:
#'
#' InProceedings\{pennington2014glove, \cr
#' author     = \{Jeffrey Pennington and Richard Socher and Christopher D. \cr
#'                Manning\}, \cr
#' title      = \{GloVe: Global Vectors for Word Representation\}, \cr
#' booktitle  = \{Empirical Methods in Natural Language Processing (EMNLP)\}, \cr
#' year       = 2014 \cr
#' pages      = \{1532-1543\} \cr
#' url        = \{http://www.aclweb.org/anthology/D14-1162\} \cr
#' \}
#'
#' @references Jeffrey Pennington, Richard Socher, and Christopher D. Manning.
#'   2014. GloVe: Global Vectors for Word Representation.
#'
#' @inheritParams lexicon_afinn
#' @param dimensions A number indicating the number of vectors to include. One
#'   of 50, 100, 200, or 300 for glove6b, or one of 25, 50, 100, or 200 for
#'   glove27b.
#' @return A tibble with 400k, 1.9m, 2.2m, or 1.2m rows (one row for each unique
#'   token in the vocabulary) and the following variables:
#' \describe{
#'   \item{token}{An individual token (usually a word)}
#'   \item{d1, d2, etc}{The embeddings for that token.}
#' }
#' @source \url{https://nlp.stanford.edu/projects/glove/}
#' @keywords datasets
#' @family embeddings
#' @examples
#' \dontrun{
#' embedding_glove6b(dimensions = 50)
#'
#' # Custom directory
#' embedding_glove42b(dir = "data/")
#'
#' # Deleting dataset
#' embedding_glove6b(delete = TRUE, dimensions = 300)
#'
#' # Returning filepath of data
#' embedding_glove840b(return_path = TRUE)
#' }
#' @name embedding_glove
NULL

#' @rdname embedding_glove
#' @export
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
embedding_glove6b <- function(dir = NULL,
                              dimensions = c(50, 100, 200, 300),
                              delete = FALSE,
                              return_path = FALSE,
                              clean = FALSE,
                              manual_download = FALSE) {
  this_glove <- "6b"
  available_dims <- c(50, 100, 200, 300)
  all_names <- construct_glove_name(this_glove, available_dims)
  dimensions <- as.character(dimensions)
  dimensions <- match.arg(dimensions, as.character(available_dims))
  name <- construct_glove_name(this_glove, dimensions)
  load_dataset(
    data_name = "glove6b", name = name, dir = dir,
    delete = delete, return_path = return_path, clean = clean,
    clean_manual = all_names,
    manual_download = manual_download
  )
}

#' @keywords internal
construct_glove_name <- function(tokens = c("6b", "27b"),
                                 dimensions = c(25, 50, 100, 200, 300)) {
  tokens <- match.arg(tokens)
  dimensions <- as.character(dimensions)
  dimensions <- match.arg(
    dimensions,
    choices = as.character(c(25, 50, 100, 200, 300)),
    several.ok = TRUE
  )
  paste0(
    paste(
      "glove",
      tokens,
      dimensions,
      sep = "_"
    ),
    ".rds"
  )
}

#' @rdname embedding_glove
#' @export
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
embedding_glove27b <- function(dir = NULL,
                               dimensions = c(25, 50, 100, 200),
                               delete = FALSE,
                               return_path = FALSE,
                               clean = FALSE,
                               manual_download = FALSE) {
  this_glove <- "27b"
  available_dims <- c(25, 50, 100, 200)
  all_names <- construct_glove_name(this_glove, available_dims)
  dimensions <- as.character(dimensions)
  dimensions <- match.arg(dimensions, as.character(available_dims))
  name <- construct_glove_name(this_glove, dimensions)
  load_dataset(
    data_name = "glove27b", name = name, dir = dir,
    delete = delete, return_path = return_path, clean = clean,
    clean_manual = all_names,
    manual_download = manual_download
  )
}

#' @rdname embedding_glove
#' @export
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
embedding_glove42b <- function(dir = NULL,
                               delete = FALSE,
                               return_path = FALSE,
                               clean = FALSE,
                               manual_download = FALSE) {
  name <- "glove_42b.rds"
  load_dataset(
    data_name = "glove42b", name = name, dir = dir,
    delete = delete, return_path = return_path, clean = clean,
    manual_download = manual_download
  )
}

#' @rdname embedding_glove
#' @export
#' @importFrom fs file_exists dir_exists dir_create path
#' @importFrom readr read_rds
#' @importFrom utils menu
embedding_glove840b <- function(dir = NULL,
                                delete = FALSE,
                                return_path = FALSE,
                                clean = FALSE,
                                manual_download = FALSE) {
  name <- "glove_840b.rds"
  load_dataset(
    data_name = "glove840b", name = name, dir = dir,
    delete = delete, return_path = return_path, clean = clean,
    manual_download = manual_download
  )
}

#' @importFrom utils download.file
#' @keywords internal
download_glove6b <- function(folder_path) {
  file_path <- path(folder_path, "glove.6B.zip")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(
    url = "http://nlp.stanford.edu/data/glove.6B.zip",
    destfile = file_path
  )
}

#' @importFrom utils download.file
#' @keywords internal
download_glove42b <- function(folder_path) {
  file_path <- path(folder_path, "glove.42B.300d.zip")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(
    url = "http://nlp.stanford.edu/data/glove.42B.300d.zip",
    destfile = file_path
  )
}

#' @importFrom utils download.file
#' @keywords internal
download_glove840b <- function(folder_path) {
  file_path <- path(folder_path, "glove.840B.300d.zip")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(
    url = "http://nlp.stanford.edu/data/glove.840B.300d.zip",
    destfile = file_path
  )
}

#' @importFrom utils download.file
#' @keywords internal
download_glove27b <- function(folder_path) {
  file_path <- path(folder_path, "glove.twitter.27B.zip")
  if (file_exists(file_path)) {
    return(invisible())
  }
  download.file(
    url = "http://nlp.stanford.edu/data/glove.twitter.27B.zip",
    destfile = file_path
  )
}

#' @keywords internal
process_glove6b <- function(folder_path, name_path) {
  # Processing all datasets when they only need one adds time. We'll
  # specifically deal with the one they requested, which means we need to
  # extract the dimensions back out of the name to build the raw filename.
  filename <- gsub(folder_path, "", name_path)
  dimensions <- unlist(strsplit(filename, "_|\\."))[[3]]
  raw_name <- paste0("glove.6B.", dimensions, "d.txt")
  file <- unz(path(folder_path, "glove.6B.zip"), raw_name)

  write_glove(file, name_path, dimensions)
}

#' @keywords internal
process_glove42b <- function(folder_path, name_path) {
  dimensions <- 300
  raw_name <- "glove.42B.300d.txt"
  file <- unz(path(folder_path, "glove.42B.300d.zip"), raw_name)

  write_glove(file, name_path, dimensions)
}

#' @keywords internal
process_glove840b <- function(folder_path, name_path) {
  dimensions <- 300
  raw_name <- "glove.840B.300d.txt"
  file <- unz(path(folder_path, "glove.840B.300d.zip"), raw_name)

  write_glove(file, name_path, dimensions)
}

#' @keywords internal
process_glove27b <- function(folder_path, name_path) {
  filename <- gsub(folder_path, "", name_path)
  dimensions <- unlist(strsplit(filename, "_|\\."))[[3]]
  raw_name <- paste0("glove.twitter.27B.", dimensions, "d.txt")

  file <- unz(path(folder_path, "glove.twitter.27B.zip"), raw_name)

  write_glove(file, name_path, dimensions)
}

#' @importFrom readr read_delim write_rds
#' @keywords internal
write_glove <- function(file, name_path, dimensions) {
  embeddings <- read_delim(
    file,
    delim = " ",
    quote = "",
    col_names = c(
      "token",
      paste0("d", seq_len(dimensions))
    ),
    col_types = paste0(
      c(
        "c",
        rep("d", dimensions)
      ),
      collapse = ""
    )
  )

  write_rds(embeddings, name_path)
}
