\name{uik}
\alias{uik}
\title{
Implementation of Unit Invariant Knee (UIK) method for finding the knee point of a curve
}
\description{
It finds the UIK estimation for elbow or knee point of a curve, see [1] for details.
}
\usage{
uik(x, y)
}
\arguments{
  \item{x}{
The numeric vector of x-abscissas, must be of length at least 4.
}
  \item{y}{
The numeric vector of y-abscissas, must be of length at least 4.
}
}
\details{
Given the x, y numeric vectors it first checks the curve by using \code{\link{check_curve}}
and classifies it as convex, concave or convex/concave, concave/convex.
}
\value{
It returns the x-abscissa which is the UIK estimation for the knee point.
}
\references{
[1] Christopoulos, Demetris T., Introducing Unit Invariant Knee (UIK) As an Objective Choice 
    for Elbow Point in Multivariate Data Analysis Techniques (March 1, 2016).
    Available at SSRN: https://ssrn.com/abstract=3043076 or http://dx.doi.org/10.2139/ssrn.3043076
}
\author{
Demetris T. Christopoulos
}
\seealso{
\code{\link{check_curve}} and \code{\link{d2uik}}
}
\examples{
## Lets create a convex data set
x=seq(1,10,0.05)
y=1/x
plot(x,y)
knee=uik(x,y)
knee
## [1] 3.15
abline(v=knee)
## Lets add noise to them now
set.seed(20190625)
x=seq(1,10,0.05)
y=1/x+runif(length(x),-0.02,0.02)
plot(x,y)
knee=uik(x,y)
knee
## [1] 3.3
abline(v=knee)
}
\keyword{uik}
\keyword{knee}
