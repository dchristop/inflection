\name{ese}
\alias{ese}
\title{
The Extremum Surface Estimator (ESE) for finding the inflection point of a convex/concave curve
}
\description{
Implementation of ESE method as defined in [1] and [2] by giving a simple output of the method. Use of parallel computing under user request.
}
\usage{
ese(x, y, index, doparallel = FALSE)
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
If data is from an unknown function and without noise then we can find the inflection point by a way similar to bisection method way for root finding.
If data is noisy, then we have two consistent estimators of the trapezoidal estimated inflection point, i.e. we consistently estimate what we could find by computing the relevant areas with elementary trapezoids.
This method is not so fast as \code{\link{ede}} but it can be used for a fine-tuning of the result returned be EDE.
}
\value{
A matrix of size 1 x 3 is returned with elements:
  \item{A(1,1)=\eqn{i_1}}{The index j-right for ESE method}
  \item{A(1,2)=\eqn{i_2}}{The index j-left for ESE method}
  \item{A(1,3)=\eqn{\chi_{S}}}{The Extremum Surface Estimator (ESE) for inflection point}
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} 
}
\author{
Demetris T. Christopoulos
}
\note{
Use doparallel=TRUE option when you have relative large data sets (N>20000). \cr
For large data sets (one million rows) it is better to use first \code{\link{ede}} or \code{\link{bede}}
in order to locate a smaller neighbourhood of the inflection point. Then ese gives a better estimation, since it uses 
surfaces and not distances from total chord.
}
\seealso{
See also the iterative version \code{\link{bese}} and iterations plot using \code{\link{findipiterplot}}.
}
\examples{
#
#
#Fisher-pry model with heavy noise and unequal spaces, relative large data set:
#N=20001;
#set.seed(2017-05-11);x=sort(runif(N,0,10));y=5+5*tanh(x-5)+runif(N,-1,1);
#plot(x,y,type='l',ylab=expression(5+5*tanh(x-5)+epsilon[i]))
#
#t1=Sys.time();
#tese=ese(x,y,0,doparallel = TRUE);
#t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
#Time difference of 7.641404 secs
#tese;abline(v=tese[3],col='blue')
#       j1    j2      chi
# ESE 7559 12790 5.078434
#Compare with serial version (don't run):
#
# t1=Sys.time();
# tese=ese(x,y,0,doparallel = FALSE);
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# #Time difference of 24.24364 secs
# tese;
#      j1    j2      chi
# ESE 7559 12790 5.078434
#
}
\keyword{ese}