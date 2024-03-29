% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset_ag_news.R
\name{dataset_ag_news}
\alias{dataset_ag_news}
\title{AG's News Topic Classification Dataset}
\source{
\url{http://groups.di.unipi.it/~gulli/AG_corpus_of_news_articles.html}

\url{https://github.com/srhrshr/torchDatasets/raw/master/dbpedia_csv.tar.gz}
}
\usage{
dataset_ag_news(
  dir = NULL,
  split = c("train", "test"),
  delete = FALSE,
  return_path = FALSE,
  clean = FALSE,
  manual_download = FALSE
)
}
\arguments{
\item{dir}{Character, path to directory where data will be stored. If
\code{NULL}, \link[rappdirs]{user_cache_dir} will be used to determine path.}

\item{split}{Character. Return training ("train") data or testing ("test")
data. Defaults to "train".}

\item{delete}{Logical, set \code{TRUE} to delete dataset.}

\item{return_path}{Logical, set \code{TRUE} to return the path of the dataset.}

\item{clean}{Logical, set \code{TRUE} to remove intermediate files. This can
greatly reduce the size. Defaults to FALSE.}

\item{manual_download}{Logical, set \code{TRUE} if you have manually
downloaded the file and placed it in the folder designated by running
this function with \code{return_path = TRUE}.}
}
\value{
A tibble with 120,000 or 30,000 rows for "train" and "test"
    respectively and 3 variables:
\describe{
  \item{class}{Character, denoting new class}
  \item{title}{Character, title of article}
  \item{description}{Character, description of article}
}
}
\description{
The AG's news topic classification dataset is constructed by choosing 4
largest classes from the original corpus. Each class contains 30,000 training
samples and 1,900 testing samples. The total number of training samples is
120,000 and testing 7,600.
Version 3, Updated 09/09/2015
}
\details{
The classes in this dataset are

\itemize{
\item World
\item Sports
\item Business
\item Sci/Tech
}
}
\examples{
\dontrun{
dataset_ag_news()

# Custom directory
dataset_ag_news(dir = "data/")

# Deleting dataset
dataset_ag_news(delete = TRUE)

# Returning filepath of data
dataset_ag_news(return_path = TRUE)

# Access both training and testing dataset
train <- dataset_ag_news(split = "train")
test <- dataset_ag_news(split = "test")
}

}
\seealso{
Other topic: 
\code{\link{dataset_dbpedia}()},
\code{\link{dataset_trec}()}
}
\concept{topic}
\keyword{datasets}
