\name{findipl}
\alias{findipl}
\title{
Finds the s-left and s-right for a given internal point x[j]
}
\description{
From the definitions (1.3), (2.2) of references [1], [2] it is necessary to find \eqn{s_l} and \eqn{s_r} in order to estimate the Extremum Surface Estimator (ESE)
of the inflection point.
}
\usage{
findipl(x, y, j)
}
\arguments{
   \item{x}{
The numeric vector of x-abscissas, must be of length at least 4.
}
  \item{y}{
The numeric vector of the noisy or not y-ordinates, must be of length at least 4.
}
  \item{j}{
The data index j such that x=\eqn{x_j}
}
}
\value{
A list is returned that contains
\item{j}{The data index j such that x=\eqn{x_j}}
\item{x=\eqn{x_j}}{The corresponding x-abscissa}
\item{sl}{The value of s-left}
\item{sr}{The value of s-right}
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} 
}
\author{
Demetris T. Christopoulos
}
\note{
This small function is used when we are scanning for the position of inflection point in ESE method.
}
\seealso{
See also \code{\link{ese}}.
}
\examples{
#
#Lets create some data based on the Fisher-Pry model, without noise:
x<-seq(0,10,by=0.1);y<-5*(1+tanh(x-5));
tese=ese(x,y,0);tese;
#     j1 j2 chi
# ESE 39 63   5
N<-length(x);N
# [1] 101
#We know that total symmetry exists, so for the middle point it is better to compute |sl|=|sr|
j=(N-1)/2+1;j
# [1] 51
#Define the left and right chord:
fl<-function(t){y[1] + (y[j] - y[1]) * (t - x[1]) / (x[j] - x[1])}
fr<-function(t){y[j] + (y[N] - y[j]) * (t - x[j]) / (x[N] - x[j])}
#Find the s-left and s-right:
LR<-findipl(x,y,j);LR;
# [1] 51.000000  5.000000 -9.031459  9.031459
#Show all results in a plot:
plot(x,y,type="l",col="red")
lines(c(x[1],x[j]),c(y[1],y[j]),type="l",col="green")
lines(c(x[N],x[j]),c(y[N],y[j]),type="l",col="blue")
points(x[j],y[j], type = "p",pch = 19,col="black")
text(2.5,1,round(LR[3],digits=2))
text(6.5,7.5,round(LR[4],digits=2))
#The two surfaces are indeed absolutely equal |sl|=|sr|
#
}
\keyword{findipl}