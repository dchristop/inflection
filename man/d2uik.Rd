\name{d2uik}
\alias{d2uik}
\title{
Implementation of UIK method to the approximation for second order derivative of data points
}
\description{
It finds the UIK estimation for elbow or knee point of a curve, see [1] for details,
but now it applies the method to the properly prepared approximation of second derivative  
for data points.
}
\usage{
d2uik(x, y)
}
\arguments{
  \item{x}{
The numeric vector of x-abscissas, must be of length at least 6.
}
  \item{y}{
The numeric vector of y-abscissas, must be of length at least 6.
}
}
\details{
A preprocessing step is initially done in order to ensure that data points have unique x-abscissas:
\itemize{
   \item if no multiple entries exist for the same xi's, then we proceed with initial data frame
   \item if multiple entries exist for the same xi's, then we average entries and proceed with the new aggregated data frame
}
After we take the approximation of second derivative for the discrete data points as given from the second order forward divided differences 
estimation. Finally we apply UIK method on the absolute values of the estimated second derivatives.
}
\value{
It returns the x-abscissa which is the estimation for the knee point.
}
\references{
[1] Christopoulos, Demetris T., Introducing Unit Invariant Knee (UIK) As an Objective Choice 
    for Elbow Point in Multivariate Data Analysis Techniques (March 1, 2016).
    Available at SSRN: https://ssrn.com/abstract=3043076 or http://dx.doi.org/10.2139/ssrn.3043076
}
\author{
Demetris T. Christopoulos
}
\note{
This function has been created for robustnes reasons:
\itemize{
   \item many times the knee point is dependent on the number N of used data points
   \item in those cases by applying UIK method on second derivatives we obtain a result that does not depend on N
}
}
\section{Warning }{
Please use this function as a supplementary to \code{\link{uik}}.
} 
\seealso{
 \code{\link{uik}}
}
\examples{
## Lets create a convex data set with x from 1 to 10
x=seq(1,10,1)
y=1/x
plot(x,y)
uik1=uik(x,y)
uik1
## [1] 3 
uik2=d2uik(x,y)
uik2
## [1] 3
## Lets extend it from 1 to 15
x=seq(1,15,1)
y=1/x
plot(x,y)
uik1=uik(x,y)
uik1
## [1] 4 
uik2=d2uik(x,y)
uik2
## [1] 3
## We observe the d2uik remains 3
## Lets do the same job with noisy data sets:
set.seed(20190625)
x=seq(1,10,1)
y=1/x+runif(length(x),-0.02,0.02)
plot(x,y)
uik1=uik(x,y)
uik1
## [1] 3
uik2=d2uik(x,y)
uik2
## [1] 3
## Extension to 1:15
x=seq(1,15,1)
y=1/x+runif(length(x),-0.02,0.02)
plot(x,y)
uik1=uik(x,y)
uik1
## [1] 5
uik2=d2uik(x,y)
uik2
## [1] 3
## Again d2uik is stable
}
\keyword{d2uik}
\keyword{uik}
\keyword{knee}

