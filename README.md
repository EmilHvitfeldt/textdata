
<!-- README.md is generated from README.Rmd. Please edit that file -->

# textdata

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/EmilHvitfeldt/textdata.svg?branch=master)](https://travis-ci.org/EmilHvitfeldt/textdata)
<!-- badges: end -->

The goal of textdata is to provide access to text-related data sets for
easy access without bundling them inside a package. Some text datasets
are too large to store within an R package or are licensed in such a way
that prevents them from being included in an OSS-licensed package.
Instead, this package provides a framework to download, parse, and store
the datasets on the disk and load them when needed.

## Installation

You can install the not yet released version of textdata from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("textdata")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("EmilHvitfeldt/textdata")
```

## Example

The first time you use one of the functions for accessing an included
text dataset, such as `lexicon_afinn()` or
`dataset_sentence_polarity()`, the function will prompt you to agree
that you understand the dataset’s license or terms of use and then
download the dataset to your computer.

![](man/figures/textdata_demo.gif)

After the first use, each time you use a function like
`lexicon_afinn()`, the function will load the dataset from disk.

## Included text datasets

As of today, the datasets included in textdata
are:

| Dataset                                                         | Function                      |
| --------------------------------------------------------------- | ----------------------------- |
| v1.0 sentence polarity dataset                                  | `dataset_sentence_polarity()` |
| AFINN-111 sentiment lexicon                                     | `lexicon_afinn()`             |
| Hu and Liu’s opinion lexicon                                    | `lexicon_bing()`              |
| Loughran and McDonald’s opinion lexicon for financial documents | `lexicon_loughran()`          |

Check out each function’s documentation for detailed information
(including citations) for the relevant dataset.

## Community Guidelines

Note that this project is released with a [Contributor Code of
Conduct](https://github.com/EmilHvitfeldt/textdata/blob/master/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
Feedback, bug reports (and fixes\!), and feature requests are welcome;
file issues or seek support
[here](http://github.com/EmilHvitfeldt/textdata/issues). For details on
how to add a new dataset to this package, check out the vignette\!
