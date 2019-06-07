processs <- setdiff(
  ls(getNamespace("textdata"), pattern = "^process_"),
  "process_functions"
)

test_that("All process functions are included in process_functions", {

  expect_equal(
    length(processs),
    length(textdata:::process_functions)
  )
})

test_that("All process functions has the folder_path argument", {
  for (fun in processs) {
    expect_equal(
      names(formals(get(fun, getNamespace("textdata")))),
      c("folder_path", "name_path")
    )
  }
})

test_that("the process functions are named right according to print_info", {
  testthat::expect_setequal(
    paste0("process_", names(textdata:::print_info)),
    processs
  )
})
