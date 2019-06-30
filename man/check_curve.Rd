\name{check_curve}
\alias{check_curve}
\title{
Checks a curve and decides for its convexity type
}
\description{
Given a planar curve with discrete (xi,yi) points this function can find if it is convex, concave or
for the sigmoid case if it is convex/concave or concave/convex. 
}
\usage{
check_curve(x, y)
}
\arguments{
  \item{x}{
The numeric vector of x-abscissas
}
  \item{y}{
The numeric vector of y-abscissas
}
}
\details{
It uses the function \code{\link{findipl}} which provides us with a consistent estimator for the 
surfaces left and right that are used here, see [1],[2] for more details.
}
\value{
A list with members:
\enumerate{
\item ctype, the convexity type of the curve
\item index, the index that can be used from other functions to identify the inflection point
}
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} \cr

[3]Bardsley, W. G. & Childs, R. E. Sigmoid curves, non-linear double-reciprocal plots and allosterism Biochemical Journal, Portland Press Limited, 1975, 149, 313-328
}
\author{
Demetris T. Christopoulos
}
\note{
If we do not have a visual inspection of our data, then this function is useful because it can automate the usage of all other functions that compute the inflection point.
}
\seealso{
\code{\link{findipl}}, \code{\link{ese}}, \code{\link{ede}}, \code{\link{bese}}, \code{\link{bede}} .
}
\examples{
## Lets create a really hard data set, an exxample of a "2:2 function" taken from [3]
## This function for x>0 has an inflectrion point at 
## x = -1/8+(1/24)*sqrt(381) = 0.6883008876 ~0.69
## We want to see ,if function 'check_curve()' will proper classify it,
## given that we used [0.2,4] as definition range.
f=function(x){(1/8*x+1/2*x^2)/(1+1/8*x+1/2*x^2)}
x=seq(0.2,4,0.05)
y=f(x)
plot(x,y,pch=19,cex=0.5)
cc=check_curve(x,y)
cc
## $ctype
## [1] "convex_concave"
## 
## $index
## [1] 0
##
## Yes it found it.
}
\keyword{convex}
\keyword{concave}
\keyword{convex/concave}
\keyword{concave/convex}
