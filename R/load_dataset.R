#' Internal Functions
#'
#' These are not to be used directly by the users.
#' @export
#' @importFrom fs dir_delete path file_delete
#' @keywords internal
load_dataset <- function(data_name, name, dir, delete, return_path, clean,
                         clean_manual = NULL, manual_download) {

  dir <- ifelse(is.null(dir), rappdirs::user_cache_dir("textdata"), dir)

  name_path <- path(dir, data_name, name)
  folder_path <- path(dir, data_name)

  if (!manual_download) {
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
  }

  process_functions[[data_name]](folder_path, name_path)

  if (clean) {
    if (!is.null(clean_manual)) {
      intermediate_files <- setdiff(dir_ls(folder_path),
                                    path(folder_path, clean_manual))
    } else {
      intermediate_files <- setdiff(dir_ls(folder_path), name_path)
    }
    file_delete(intermediate_files)
  }

  read_rds(name_path)
}
