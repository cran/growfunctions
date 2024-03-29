% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gpdpgrow.R
\name{gpdpbPost}
\alias{gpdpbPost}
\title{Run a Bayesian functional data model under a GP prior whose parameters employ a DP prior}
\usage{
gpdpbPost(
  y,
  ipr,
  Omega_t,
  Omega_s,
  gp_mod,
  jitter,
  b_move,
  gp_shape,
  gp_rate,
  noise_shape,
  noise_rate,
  lower,
  upper,
  w_star,
  w,
  n_slice_iter,
  y_index,
  n.iter,
  n.burn,
  n.thin,
  n.tune,
  M_init,
  dp_shape,
  dp_rate,
  progress
)
}
\arguments{
\item{y}{An \emph{N x T} matrix of N observations of \emph{T x 1} functions. \code{y} may\
have intermittant missing values. They should be input with \code{NA}.}

\item{ipr}{An optional input vector of inclusion probabilities for each observation unit in the case
the observed data were acquired through an informative sampling design, so that unbiased
inference about the population requires adjustments to the observed sample.  Defaults to
\code{ipr = rep(1,nrow(y))} indicating an iid sample.}

\item{Omega_t}{A \emph{T x T} matrix of squared Eucidean distances for \code{T} time points}

\item{Omega_s}{A \code{list} object of length \code{L_s}, where each contains the \emph{T x T}
matrix of Euclidean distances associated to each seasonal covariance term.}

\item{gp_mod}{An \emph{L x 1} numeric vector denoting the selected covariance function for each
of \code{L} terms.  \code{gp_mod = 1} is \code{"rq"}.  \code{gp_mod = 2} is \code{"se"}.
\code{gp_mod = 3} is \code{"sn"}.}

\item{jitter}{Numeric value added to diagonals of GP covariance matrix to stabilize inversion.}

\item{b_move}{An indicator in \code{{0,1}} denoting whether to sample GP functions, \code{(bb_i)}
in a \emph{T x 1} Gibbs step or through elliptical slice sampling.
\code{b_move = 1} samples in a Gibbs step. Defaults to \code{b_move = 1}.}

\item{gp_shape}{The shape parameter of the Gamma base distribution for the \code{kappa_star}
locations used to sample the DP prior on the \code{P} GP covariance parameters, 
\code{kappa}, for each experimental unit.}

\item{gp_rate}{The rate parameter of the Gamma base distribution for the \code{kappa_star}
locations used to sample the DP prior on the \code{P} GP covariance parameters, 
\code{kappa}, for each experimental unit.}

\item{noise_shape}{The shape parameter of the Gamma base distribution on \code{tau_e}, the
model noise precision parameter. Defaults to \code{noise_shape = 3}.}

\item{noise_rate}{The rate parameter of the Gamma base distribution on \code{tau_e}, the model
noise precision parameter.  Defaults to \code{noise_rate = 1}.}

\item{lower}{Minimum in range of support for GP covariance parameters, \code{kappa}.}

\item{upper}{Maximum in range of support for GP covariance parameters, \code{kappa}.}

\item{w_star}{Tuning parameter for number of locations to sample not linked to observations
in the auxiliary Gibbs sampler for cluster assignments.}

\item{w}{Tuning parameter for slice sampling interval width used for GP 
covariance parameters, \code{kappa}.}

\item{n_slice_iter}{Maximum number of steps to widen slice samplind width for
GP covariance parameters, \code{kappa}.}

\item{y_index}{List object where each contains index of time points to use in \code{n}
progressively coarser distribution for sampling \code{kappa} in tempered update steps.}

\item{n.iter}{The number of MCMC sampling iterations}

\item{n.burn}{The number of warm-up iterations to discard}

\item{n.thin}{The interval or step size of post-burn-in samples to return}

\item{n.tune}{The number of tuning iterations to update the slice sampler width, \code{w}.}

\item{M_init}{Starting value of number of clusters for sampling cluster assignments.}

\item{dp_shape}{The shape parameter for the \eqn{\Gamma} prior on the DP concentration parameter.
The rate parameter is set of \code{1}.}

\item{dp_rate}{The rate parameter for the \eqn{\Gamma} prior on the DP concentration parameter. 
Default value is \code{1}.}

\item{progress}{An indicator in \code{{0,1}} denoting whether to display a progress bar during model execution.
\code{progress = 1} displays a progress bar. Defaults to \code{progress = 1}.}
}
\value{
res A list object containing MCMC runs for all model parameters.
}
\description{
An internal function to \code{\link{gpdpgrow}}
}
\note{
Intended as an internal function for \code{\link{gpdpgrow}}
}
\seealso{
\code{\link{gpdpgrow}}
}
\author{
Terrance Savitsky \email{tds151@gmail.com}
}
