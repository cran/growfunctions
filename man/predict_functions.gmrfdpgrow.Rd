% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gmrfdpgrow.R
\name{predict_functions.gmrfdpgrow}
\alias{predict_functions.gmrfdpgrow}
\title{Use the model-estimated iGMRF precision parameters from gmrfdpgrow() to predict the iGMRF function at
future time points.  Inputs the \code{gmrfdpgrow} object of estimated parameters.}
\usage{
\method{predict_functions}{gmrfdpgrow}(object, J = 500, T_test, ...)
}
\arguments{
\item{object}{Object of class \code{gmrfdpgrow} returned from model run of \code{gmrfdpgrow()}}

\item{J}{Scalar denoting number of draws to take from posterior predictive for each unit.
Defaults to \code{J = 500}.}

\item{T_test}{The number of equally-spaced time points to predict the iGMRF functions ahead of 
of the functions estimated at \code{T_train} time points.}

\item{...}{further arguments passed to or from other methods.}
}
\value{
out  A list object containing containing two matrices; the first is a P x (N*T)
                 matrix of predicted function values for each of P sampled iterations.  N is 
                 slow index and denotes the number of experimental units.  The second matrix is
                 an N x T average over the P sampled draws, composed in Rao-Blackwellized fashion.
}
\description{
A companion function to \code{\link{gmrfdpgrow}}
}
\note{
Intended as a companion function for \code{\link{gmrfdpgrow}} for prediction
}
\examples{
\dontrun{
library(growfunctions)
data(cps)
y_short   <- cps$y[,(cps$yr_label \%in\% c(2010:2013))]
t_train   <- ncol(y_short)
N         <- nrow(y_short)
t_test    <- 4
 
## Model Runs

res_gmrf            = gmrfdpgrow(y = y_short, 
                                q_order = c(2,4), 
                                q_type = c("tr","sn"), 
                                n.iter = 100, 
                                n.burn = 50, 
                                n.thin = 1) 
## Prediction Model Runs
T_test             <- 4

pred_gmrf          <- predict_functions( object = res_gmrf,
                                     J = 1000, 
                                     T_test = T_test )

## plot estimated and predicted functions
plot_gmrf       <- predict_plot(object = pred_gmrf, 
                               units_label = cps$st, 
                               single_unit = TRUE, 
                               credible = FALSE)
}
}
\seealso{
\code{\link{gmrfdpgrow}}
}
\author{
Terrance Savitsky \email{tds151@gmail.com}
}
