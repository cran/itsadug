% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eval.R
\name{diagnostics}
\alias{diagnostics}
\title{Visualization of the model fit for time series data.}
\usage{
diagnostics(
  model,
  plot = "all",
  ask = TRUE,
  print.summary = getOption("itsadug_print")
)
}
\arguments{
\item{model}{A lm or gam object, produced by \code{\link[mgcv]{gam}} or 
\code{\link[mgcv]{bam}}, \code{\link[stats]{lm}}, \code{\link[stats]{glm}}.}

\item{plot}{A text string or numeric vector indicating which diagnostic 
plots to show. Default is 'all'. See Section 'Details' for the different 
options.}

\item{ask}{Logical: whether the user is prompted before starting a new 
page of output. Defaults to TRUE.}

\item{print.summary}{Logical: whether or not to print summary.
Default set to the print info messages option 
(see \code{\link{infoMessages}}).}
}
\description{
Diagnostic plots for evaluating the model fit.
}
\section{Details}{

When \code{plot='all'}, the following plots are generated:
\enumerate{
  \item Residuals by fitted values. Used for inspection of general trends 
in the residuals.
  \item Residuals ordered by predictor. Useful for checking how the trends 
of individual predictors are captured by the model.
  \item Distribution of residuals. QQ plot that compares the distribution 
of the residuals with the normal distribution. 
  \item ACF of residuals. Inspection of autocorrelation in the residuals. 
See also \code{\link{acf_resid}}.
  \item Trends in the random smooths. Be careful with the interpretation of 
the 'fixed' effects and interactions when the random smooths show trends. 
See examples below.
  \item Printing distributions of numeric predictors.
}
}

\examples{

data(simdat)
\dontrun{
# no random smooths:
m1 <- bam(Y ~ Group + s(Time, by=Group) + s(Trial) + s(Subject, bs='re'), data=simdat)
diagnostics(m1)

# only plot residuals by predictor:
diagnostics(m1, plot=2)

# without prompts:
par(mfrow=c(2,2))
diagnostics(m1, plot=1:4, ask=FALSE)

# only plot random smooths:
diagnostics(m1, plot=5)
# Note: the plot does not change,
# because there are no random smooths to plot.

# with random smooths
m2 <- bam(Y ~ Group + s(Time, by=Group) + s(Time, Subject, bs='fs', m=1), data=simdat)  
diagnostics(m2)  

## INSPECTION OF RANDOM SMOOTHS 
## ----------------------------

# In this underspecified model (too much smoothing for the interaction)
# part of the effect of Time is captured by the random smooths:
m3 <- bam(Y ~ te(Time, Trial, k=c(3,3)) + s(Time, Subject, bs='fs', m=1), data=simdat) 

# The plot shows a clear trend in the average of the random smooths, 
# and the amplitude of the mean (!) curve is almost as large as the 
# amplitude of the 'fixed' effect of Time:
diagnostics(m3, plot=5, ask=FALSE)

# Compare with the following models:
m4 <- bam(Y ~ te(Time, Trial, k=c(10,5)) + s(Time, Subject, bs='fs', m=1), data=simdat) 
diagnostics(m4, plot=5, ask=FALSE)

m5 <- bam(Y ~ s(Time) + s(Trial) + ti(Time, Trial) 
    + s(Time, Subject, bs='fs', m=1), data=simdat) 
diagnostics(m5, plot=5, ask=FALSE)

}
}
\seealso{
Other Model evaluation: 
\code{\link{check_resid}()},
\code{\link{plot_modelfit}()}
}
\author{
Jacolien van Rij
}
\concept{Model evaluation}
