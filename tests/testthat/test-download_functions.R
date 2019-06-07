downloads <- setdiff(
  ls(getNamespace("textdata"), pattern = "^download_"),
  "download_functions"
  )

test_that("All download functions are included in download_functions", {

  expect_equal(
    length(downloads),
    length(textdata:::download_functions)
  )
})

test_that("All download functions has the folder_path argument", {
  for (fun in downloads) {
    expect_equal(
      names(formals(get(fun, getNamespace("textdata")))),
      "folder_path"
    )
  }
})

test_that("the download functions are named right according to print_info", {
  testthat::expect_setequal(
    paste0("download_", names(textdata:::print_info)),
    downloads
  )
})
