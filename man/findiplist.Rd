\name{findiplist}
\alias{findiplist}
\title{
The Extremum Surface Estimator (ESE) and Extremum Distance Estimator (EDE) methods for finding the inflection point of a convex/concave curve.
}
\description{
Given the \eqn{(x_{i},y_{i}),i=1,...,N} noisy or not data we want to estimate the inflection point of the corresponding curve.
The curve can be convex before the inflection point and then concave or vice versa.
The ESE and EDE methods are applied and the results are returned as a matrix.
Parallel computing is applied under request.
}
\usage{
findiplist(x, y, index, doparallel = FALSE)
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
  \item{doparallel}{
If doparallel=TRUE then parallel computing is applied, based on the available workers of current machine (default value = FALSE)    
}
}
\details{
If data is from an unknown function and without error then we can find the inflection point in a way similar to that of bisection method' s way for a root.
If data is noisy, then we have two consistent estimators of the inflection point.
}
\value{
A matrix of size 2 x 3 is returned with elements:
  \item{A(1,1)=\eqn{i_1}}{The index j-right for ESE method}
  \item{A(1,2)=\eqn{i_2}}{The index j-left for ESE method}
  \item{A(1,3)=\eqn{\chi_{S}}}{The Extremum Surface Estimator (ESE) for inflection point}
  \item{A(2,1)=\eqn{i_1}}{The index j1 for EDE method}
  \item{A(2,2)=\eqn{i_2}}{The index j2 for EDE method}
  \item{A(2,3)=\eqn{\chi_{D}}}{The Extremum Distance Estimator (EDE) for inflection point, if this method is applicable}
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} 
}
\author{
Demetris T. Christopoulos
}
\note{
It is a simple implementation of both ESE and EDE methods to a data set of at least 4 xy-pairs.
}
\seealso{
See also the simple versions \code{\link{ese}} and \code{\link{ede}}.
}
\examples{
#Lets create some convex/concave data based on the Fisher-Pry model
#by using 1001 not equal spaced abscissas with data right asymmetry
N=1001;
#Case I: data without noise
set.seed(2017-05-11);x=sort(runif(N,0,15));y=5+5*tanh(x-5);
A=findiplist(x,y,0);A;
#      j1  j2      chi
# ESE 242 438 4.848448
# EDE 228 478 5.000907
plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,15));
abline(v=A[,3],col=c("blue","red"))
text(A[1,3]-0.5,0,expression(chi[S]),font=2);
text(A[2,3]+0.5,0,expression(chi[D]),font=2);
grid();
#
###Case II: noisy data
set.seed(2017-05-11);x=sort(runif(N,0,15));y=5+5*tanh(x-5)+rnorm(N,0,0.05);
A=findiplist(x,y,0);A;
#      j1  j2      chi
# ESE 245 437 4.853798
# EDE 245 469 5.030581
plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,15));
abline(v=A[,3],col=c("blue","red"))
text(A[1,3]-0.5,0,expression(chi[S]),font=2);
text(A[2,3]+0.5,0,expression(chi[D]),font=2);
grid();
#
}
\keyword{inflection}
\keyword{ese}
\keyword{ede}