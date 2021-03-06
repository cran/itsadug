% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{modeledf}
\alias{modeledf}
\title{Retrieve the degrees of freedom specified in the model.}
\usage{
modeledf(model)
}
\arguments{
\item{model}{A fitted regression model (using gam, or bam).}
}
\value{
Numeric value: degrees of freedom specified in the model.
}
\description{
Retrieve the degrees of freedom specified in the model.
}
\examples{
data(simdat)

\dontrun{
# models take somewhat longer time to run:

# Fit simple GAM model:
gam1 <- bam(Y ~ s(Time), data=simdat, discrete=TRUE)
modeledf(gam1)
gam2 <- bam(Y ~ s(Time)+s(Time, Subject, bs='fs', m=1), 
    data=simdat, discrete=TRUE)
modeledf(gam2)
gam3 <- bam(Y ~ Subject+s(Time, by=Subject), 
    data=simdat, discrete=TRUE)
modeledf(gam3)
gam4 <- bam(Y ~ Group+s(Time)+s(Time, Subject, bs='fs', m=1), 
    data=simdat, discrete=TRUE)
modeledf(gam4) 
gam5 <- bam(Y ~ Group+s(Time, by=Group)+s(Time, Subject, bs='fs', m=1), 
    data=simdat, discrete=TRUE)
modeledf(gam5) 

# Fit a gamm:
gam6 <- gamm(Y ~ Group+s(Time), random=list(Subject=~1) data=simdat, discrete=TRUE)
# this produces an error...
modeledf(gam6)
# ... but this works:
modeledf(gam6$gam)
}

}
\seealso{
Other Utility functions: 
\code{\link{convertNonAlphanumeric}()},
\code{\link{corfit}()},
\code{\link{diff_terms}()},
\code{\link{find_difference}()},
\code{\link{missing_est}()},
\code{\link{observations}()},
\code{\link{print_summary}()},
\code{\link{refLevels}()},
\code{\link{res_df}()},
\code{\link{summary_data}()},
\code{\link{timeBins}()}
}
\concept{Utility functions}
