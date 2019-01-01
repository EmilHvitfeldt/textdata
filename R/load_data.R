load_data <- function(x) {
  UseMethod("load_data")
}

load_data.default <- function(x) {
  stop(
    "Data set <",
    class(x)[[1]],
    "> isn't available.",
    call. = FALSE
  )
}
