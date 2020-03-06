# tidytext

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/tidytext
* URL: http://github.com/juliasilge/tidytext
* BugReports: http://github.com/juliasilge/tidytext/issues
* Date/Publication: 2020-03-04 06:30:05 UTC
* Number of recursive dependencies: 159

Run `revdep_details(,"tidytext")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(tidytext)
      > 
      > test_check("tidytext")
      [31m──[39m [31m1. Failure: Can tidy corpus from tm package (@test-corpus-tidiers.R#15) [39m [31m────────────────[39m
      paste(as.character(ovid[[1]]), collapse = " ") not equal to td$text[1].
      names for current but not for target
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════
      [ OK: 297 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: Can tidy corpus from tm package (@test-corpus-tidiers.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

