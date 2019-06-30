\name{bede}
\alias{bede}
\title{
Bisection Extremum Distance Estimator Method 
}
\description{
It iterates in a way similar to the well known bisection method in root finding, with the only exception that 
our \eqn{[a_{n},b_{n}]} intervals contain the inflection point now and the rule for choosing them follows definitions
and Lemmas of [1], [2].
}
\usage{
bede(x, y, index)
}
\arguments{
  \item{x}{
The numeric vector of x-abscissas, must be of length at least 4.
}
  \item{y}{
The numeric vector of the noisy or not y-ordinates, must be of length at least 4.
}
  \item{index}{
If data is convex/concave then index=0 \cr
If data is concave/convex then index=1
}
}
\details{
It is the fastest solution for very large data sets, over one million rows.
}
\value{
It returns a list of two elements: \cr
\item{iplast}{the last EDE estimation that was found}
\item{iters}{a matrix with 4 columns ("n", "a", "b", "EDE") that give the number of x-y pairs 
used at each iteration, the [a,b] range where we searched and the EDE estimated inflection point.}
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} 
}
\author{
Demetris T. Christopoulos
}
\seealso{
See also the simple version \code{\link{ede}}, \code{\link{edeci}} and iterations plot using \code{\link{findipiterplot}}.
}
\examples{
#
#Fisher-pry model with heavy noise, unequal spaces
#and 1 million cases:
N=10^6+1;
set.seed(2017-05-11);x=sort(runif(N,0,10));y=5+5*tanh(x-5)+runif(N,-1,1);
#
ptm <- proc.time()
tede=ede(x,y,0);tede;proc.time() - ptm
#         j1     j2      chi
# EDE 351061 648080 4.997139
# user  system elapsed 
# 0.02    0.02    0.05 
#
}
\keyword{bede}
\keyword{iterative}
\keyword{bisection}