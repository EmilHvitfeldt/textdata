#' Internal Functions
#'
#' These are not to be used directly by the users.
#' @export
#' @importFrom fs dir_delete
#' @keywords internal
load_dataset <- function(data_name, name, dir = "~/.textdata/", delete = FALSE) {
  name_path <- paste0(dir, data_name, "/", name, collapse = "")
  folder_path <- paste0(dir, data_name, "/", collapse = "")

  if(delete) {
    dir_delete(folder_path)
    return(invisible())
  }

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
