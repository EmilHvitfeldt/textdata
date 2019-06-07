#' Internal Functions
#'
#' These are not to be used directly by the users.
#' @export
#' @param dir Character, path to directory where data will be stored. If left
#'     unchanged [rappdirs::user_cache_dir] will be used to determine path.
#' @param delete Logical, set TRUE to delete dataset.
#' @param return_path Logical, set TRUE to return the path of the dataset.
#' @importFrom fs dir_delete path
#' @keywords internal
#' @export
load_dataset <- function(data_name, name, dir = NULL, delete = FALSE,
                         return_path = FALSE) {

  dir <- ifelse(is.null(dir), rappdirs::user_cache_dir("textdata"), dir)

  name_path <- path(dir, data_name, name)
  folder_path <- path(dir, data_name)

  if (return_path) {
    return(folder_path)
  }


  if (delete) {
    dir_delete(folder_path)
    return(invisible())
  }

  if (file_exists(name_path)) {
    return(read_rds(name_path))
  }

  if (printer(data_name) == 2) {
    return(invisible())
  }

  if (!dir_exists(folder_path)) {
    dir_create(folder_path)
  }

  download_functions[[data_name]](folder_path)

  process_functions[[data_name]](folder_path, name_path)
  read_rds(name_path)
}
