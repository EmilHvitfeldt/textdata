#' List folders and their sizes in cache
#'
#' This function will return a tibble with the name and sizes of all folder in
#' specified directory. Will default to textdata's default cache.
#'
#' @inheritParams lexicon_afinn
#'
#' @return A tibble with 2 variables:
#' \describe{
#'   \item{name}{Name of the folder}
#'   \item{size}{Size of the folder}
#' }
#' @export
#'
#' @examples
#' \dontrun{
#' cache_info()
#' }
cache_info <- function(dir = NULL) {
  dir <- ifelse(is.null(dir), rappdirs::user_cache_dir("textdata"), dir)

  folders <- fs::dir_info(dir)

  folders <- folders$path[folders$type == "directory"]

  sizes <- vapply(folders, folder_size, numeric(1))

  tibble::tibble(
    name = basename(folders),
    size = fs::as_fs_bytes(sizes)
  )
}

folder_size <- function(x) {
  sum(fs::dir_info(x)$size)
}
