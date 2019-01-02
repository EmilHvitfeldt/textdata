#' Internal Functions
#'
#' These are not to be used directly by the users.
#' @export
#' @keywords internal
load_dataset <- function(data_name, name, dir = "~/.textdata/") {
  name_path <- paste0(dir, data_name, "/", name, collapse = "")
  folder_path <- paste0(dir, data_name, "/", collapse = "")

  if(file_exists(name_path)) {
    return(read_rds(name_path))
  }

  if(printer(data_name) == 2) {
    return(invisible())
  }

  if(!dir_exists(folder_path)) {
    dir_create(folder_path)
  }

  download_functions[[data_name]](folder_path)

  process_functions[[data_name]](folder_path, name_path)
  read_rds(name_path)
}
