test_that("print_info has right names", {
  lapply(textdata:::print_info,
         function(x) expect_true(all(names(x) == c("name", "url", "license", "size", "type", "description"))))
})
