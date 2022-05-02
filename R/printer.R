#' Internal Functions
#'
#' These are not to be used directly by the users.
#' @keywords internal
#' @noRd
printer <- function(name) {
  title <- cat(
    "Do you want to download:\n",
    "Name:", print_info[[name]][["name"]], "\n",
    "URL:", print_info[[name]][["url"]], "\n",
    "License:", print_info[[name]][["license"]], "\n",
    "Size:", print_info[[name]][["size"]], "\n",
    "Download mechanism:", print_info[[name]][["download_mech"]], "\n"
  )

  if (!is.na(print_info[[name]][["citation"]])) {
    title <- cat(
      title,
      print_info[[name]][["citation"]], "\n"
    )
  }

  menu(choices = c("Yes", "No"), title = title)
}
