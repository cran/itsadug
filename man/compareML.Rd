% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/compareML.R
\name{compareML}
\alias{compareML}
\title{Function for comparing two GAMM models.}
\usage{
compareML(model1, model2)
}
\arguments{
\item{model1}{First model.}

\item{model2}{Second model.}
}
\value{
Optionally returns the Chi-Square test table.
}
\description{
Function for comparing two GAMM models.
}
\details{
As an Chi-Square test is performed on two times the difference in
minimized smoothing parameter selection score (GCV, fREML, REML, ML),
and the difference in degrees of freedom specified in the model.
The degrees of freedom of the model terms are the sum of
1) the number of estimated smoothing parameters for the model,
2) number of parametric (non-smooth) model terms including the intercept,
and 3) the sum of the penalty null space dimensions of each smooth object.

This method is preferred over other functions such as \code{\link{AIC}} for
models that include an AR1 model or random effects (especially nonlinear
random smooths using \code{bs="fs"}). CompareML also reports the AIC
difference, but that value should be treated with care.

Note that the Chi-Square test will result in a very low p-value
when the difference in degrees of freedom approaches zero. Use common sense
to determine if the difference between the two models is meaningful.
A warning is presented when the difference in score is smaller
than 5.

The order of the two models is not important.
Model comparison is only implemented for the methods GCV, fREML, REML, and ML.
}
\examples{
data(simdat)

\dontrun{
# some arbitrary models:
m1 <- bam(Y~Group + s(Time, by=Group), method="fREML", data=simdat)
m2 <- bam(Y~Group + s(Time), method="fREML", data=simdat)

compareML(m1, m2)
}
}
\author{
Jacolien van Rij. With many thanks to Simon N. Wood for his feedback.
}
\seealso{
For models without AR1 model or random effects \code{\link{AIC}} can be used.
}
