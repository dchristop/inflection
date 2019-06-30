\name{bese}
\alias{bese}
\title{
Bisection Extremum Surface Estimator Method
}
\description{
It iterates in a way similar to the well known bisection method in root finding, with the only exception that 
our \eqn{[a_{n},b_{n}]} intervals contain the inflection point now and the rule for choosing them follows definitions
and Lemmas of [1], [2]. It uses parallel computing under user request.
}
\usage{
bese(x, y, index, doparallel = FALSE)
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
This function is suitable for making a `fine tuning' while searching for inflection point.
For very large data sets it is better using first EDE method, see \code{\link{ede}}.
Then we apply BESE at a smaller range.
}
\value{
It returns a list of two elements: \cr
\item{iplast}{the last estimation found}
\item{iters}{a matrix with 4 columns ("n", "a", "b", "ESE") that give the number of x-y pairs 
used at each iteration, the [a,b] range where we searched and the ESE estimated inflection point.}
}
\references{
[1]Demetris T. Christopoulos, Developing methods for identifying the inflection point of a convex/ concave curve. arXiv:1206.5478v2 [math.NA], \url{https://arxiv.org/pdf/1206.5478v2.pdf}, 2014 \cr

[2]Demetris T. Christopoulos, On the efficient identification of an inflection point,International Journal of Mathematics and Scientific Computing,(ISSN: 2231-5330), vol. 6(1), \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf}, 2016
}
\author{
Demetris T. Christopoulos
}
\note{
Parallel computing was added in version 1.3
}
\seealso{
See also the simple version \code{\link{ese}} and iterations plot using \code{\link{findipiterplot}}.
}
\examples{
#Fisher-pry model with noise and 50k cases:
N=5*10^4+1;
set.seed(2017-05-11);x=seq(0,15,length.out = N);y=5+5*tanh(x-5)+runif(N,-0.25,0.25);
#We first run BEDE to find a smaller neighborhood for inflection point
iters=bede(x,y,0)$iters;
iters;
#Now we find last interval
ab=apply(iters[dim(iters)[1],c('a','b')],2,function(xx,x){which(x==xx)},x);ab;
#Apply BESE to that
eseit=bese(x[ab[1]:ab[2]],y[ab[1]:ab[2]],0)
eseit$iplast
eseit$iters
#Or apply directly to data with doparallel=TRUE
#
#t1=Sys.time();
#eseit=bese(x,y,0,doparallel = TRUE);#...Bisection ESE (BESE)
#t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 56.14608 secs
#eseit$iplast#...last estimation for inflection point
# [1] 5.0241
#eseit$iters#...all iterations done...
#       n      a       b     ESE
# 1 50001 0.0000 15.0000 4.81740
# 2  9375 4.4721  5.6505 5.06130
# 3  3929 4.7007  5.2758 4.98825
# 4  1918 4.8654  5.1828 5.02410
#Better accuracy, slightly more time, provided that there exist multi cores.
#plot(eseit$iters$ESE,type='b');abline(h=5,col='blue',lwd=3)
#
}
\keyword{bese}
\keyword{iterative}
\keyword{bisection}