\name{ede}
\alias{ede}
\title{
The Extremum Distance Estimator (EDE) for finding the inflection point of a convex/concave curve
}
\description{
Implementation of EDE method as defined in [1] and [2] by giving a simple output of the method.
}
\usage{
ede(x, y, index)
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
We also obtain the \eqn{x_{F_{1}},x_{F_{2}}} points, see [1], [2].
}
\value{
A matrix of size 1 x 3 is returned with elements:
  \item{A(1,1)=\eqn{i_1}}{The index \eqn{j_{F_{1}}} for EDE method}
  \item{A(1,2)=\eqn{i_1}}{The index \eqn{j_{F_{2}}} for EDE method}
  \item{A(1,3)=\eqn{\chi_{D}}}{The Extremum Distance Estimator (EDE) for inflection point}
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} 
}
\author{
Demetris T. Christopoulos
}
\note{
This function is for real big data sets, more than one million rows. It is the fastest available method, see [2] for comparison to other methods.
}
\seealso{
See also the iterative version \code{\link{bede}} and iterations plot using \code{\link{findipiterplot}}.
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
# 0.01    0.00    0.01 
#
}
\keyword{ede}