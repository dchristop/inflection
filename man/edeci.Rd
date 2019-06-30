\name{edeci}
\alias{edeci}
\title{
An improved version of EDE that provides us with a Chebyshev confidence interval for inflection point
}
\description{
It computes except from the common EDE output the Chebyshev confidence interval based on Chebyshev inequality.
}
\usage{
edeci(x, y, index, k = 5)
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
  \item{k}{
According to Chebyshev's inequality we find a relevant Chebyshev confidence interval of 
the form \eqn{[\mu-k\,\sigma,\mu+k\,\sigma]}{[mu-k*sigma,mu+k*sigma]}
}
}
\details{
We define as Chebyshev confidence interval the
\deqn{[\mu-k\,\sigma,\mu+k\,\sigma]}{[mu-k*sigma,mu+k*sigma]}
where usually k=5 because it corresponds to 96\%, while an estimator of \eqn{\sigma}{sigma} is given by \eqn{s_{D}}, see Eq. (29) of [2]:\cr
\deqn{s_{D}^2=\frac{1}{2}\,s^2=\frac{1}{2}\,\sum\limits_{i=1}^{n}{(\frac{y_{i}-y_{i-1}}{2})^2}}{1/n Sum(((y[i]-y[i-1])/2)^2,i=1..n)}
}
\value{
A one row matrix with elements the output of EDE, the given k and the Chebyshev c.i.
}
\references{
Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} 
}
\author{
Demetris T. Christopoulos
}
\note{
This function works better if the noise is of a "zig-zag"" pattern, see [1].
}
\seealso{
See also the simple \code{\link{ede}} and iterative version \code{\link{bede}}.
}
\examples{
#
#Gompertz model with noise, unequal spaces
#and 1 million cases:
N=10^6+1;
set.seed(2017-05-11);x=sort(runif(N,0,10));y=10*exp(-exp(5)*exp(-x))+runif(N,-0.05,0.05);
#EDE one time only
ede(x,y,0)
#         j1     j2      chi
# EDE 372064 720616 5.465584
#Not so close to the exact point
#Let's reduce the size using BEDE
iters=bede(x,y,0)$iters;iters;
#         n            a        b      EDE
# 1 1000001 2.273591e-05 9.999994 5.465584
# 2  348553 4.237734e+00 6.017385 5.127559
# 3  177899 4.573986e+00 5.499655 5.036821
#Now we choose last interval, in order for EDE to be applicable on next run
ab=apply(iters[dim(iters)[1]-1,c('a','b')],2,function(xx,x){which(x==xx)},x);ab;
#      a      b 
# 423480 601378
#Apply edeci...
edeci(x[ab[1]:ab[2]],y[ab[1]:ab[2]],0)
#        j1     j2      chi k  chi-5*s  chi+5*s
# EDE 33355 126329 5.036821 5 4.892156 5.181485
#Very close to the true inflection point.
#
}
\keyword{edeci}