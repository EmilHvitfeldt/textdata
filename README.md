
<!-- README.md is generated from README.Rmd. Please edit that file -->
textdata
========

<!-- badges: start -->
<!-- badges: end -->
The goal of textdata is to build a repository of text related data sets for easy access without bundling them inside a package. This is done by downloading and storeing the datasets on the disk and loading them when needed.

Installation
------------

You can install the not yet released version of textdata from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("textdata")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/textdata")
```

Example
-------

``` r
library(textdata)
dataset_afinn()
#> # A tibble: 2,477 x 2
#>    word       value
#>    <chr>      <dbl>
#>  1 abandon       -2
#>  2 abandoned     -2
#>  3 abandons      -2
#>  4 abducted      -2
#>  5 abduction     -2
#>  6 abductions    -2
#>  7 abhor         -3
#>  8 abhorred      -3
#>  9 abhorrent     -3
#> 10 abhors        -3
#> # ... with 2,467 more rows
```
