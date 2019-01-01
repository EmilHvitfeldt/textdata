load_dataset <- function(data_name, name, dir = "~/.textdata/") {
  name_path <- paste0(dir, data_name, "/", name, collapse = "")
  folder_path <- paste0(dir, data_name, "/", collapse = "")

  if(file_exists(name_path)) {
    return(read_rds(name_path))
  }

  if(menu(choices = c('Yes', "No"),
          title = paste0("Do you want to downlaod", data_name,
                         " ?", collapse = "")) == 2) {
    return(invisible())
  }

  if(!dir_exists(folder_path)) {
    dir_create(folder_path)
  }

  download_functions[[data_name]](folder_path)

  process_functions[[data_name]]()
  read_rds(name_path)
}
