% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllClasses.R
\name{MLControl}
\alias{MLControl}
\alias{BootControl}
\alias{CVControl}
\alias{OOBControl}
\alias{SplitControl}
\alias{TrainControl}
\title{Resampling Controls}
\usage{
MLControl(surv_times = numeric(), seed = NULL, ...)

BootControl(samples = 25, ...)

CVControl(folds = 10, repeats = 1, ...)

OOBControl(samples = 25, ...)

SplitControl(prop = 2/3, ...)

TrainControl(...)
}
\arguments{
\item{surv_times}{numeric vector of follow-up times at which to predict
survival events.}

\item{seed}{integer to set the seed at the start of resampling.  This is set
to a random integer by default (NULL).}

\item{...}{arguments to be passed to \code{MLControl}.}

\item{samples}{number of bootstrap samples.}

\item{folds}{number of cross-validation folds (K).}

\item{repeats}{number of repeats of the K-fold partitioning.}

\item{prop}{proportion of cases to include in the training set
(\code{0 < prop < 1}).}
}
\value{
\code{MLControl} class object.
}
\description{
The base \code{MLControl} constructor initializes a set of control parameters
that are common to all resampling methods.

\code{BootControl} constructs an \code{MLControl} object for simple bootstrap
resampling in which models are fit with bootstrap resampled training sets and
used to predict the full data set.

\code{CVControl} constructs an \code{MLControl} object for repeated K-fold
cross-validation.  In this procedure, the full data set is repeatedly
partitioned into K-folds.  Within a partitioning, prediction is performed on
each of the K folds with models fit on all remaining folds.

\code{OOBControl} constructs an \code{MLControl} object for out-of-bootstrap
resampling in which models are fit with bootstrap resampled training sets and
used to predict the unsampled cases.

\code{SplitControl} constructs an \code{MLControl} object for splitting data
into a seperate trianing and test set.

\code{TrainControl} constructs an \code{MLControl} object for training and
performance evaluation to be performed on the same training set.
}
\examples{
## 100 bootstrap samples
BootControl(samples = 100)

## 5 repeats of 10-fold cross-validation
CVControl(folds = 10, repeats = 5)

## 100 out-of-bootstrap samples
OOBControl(samples = 100)

## Split sample of 2/3 training and 1/3 testing
SplitControl(prop = 2/3)

## Same training and test set
TrainControl()

}
\seealso{
\code{\link{resample}}
}
