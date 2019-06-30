\name{inflection-package}
\alias{inflection-package}
\alias{inflection}
\docType{package}
\title{
Finds the Inflection Point of a Curve
}
\description{
Implementation of methods Extremum Surface Estimator (ESE), Extremum Distance Estimator
(EDE) and their iterative versions BESE and BEDE in order to identify the inflection point of a curve.
}
\details{
The x,y data should be numeric vectors of length at least 4 without missing values. \cr 
Main functions for a convex/concave curve are: \cr
ese(x,y,0) for ESE method, see \code{\link{ese}} & iterative version \code{\link{bese}} for BESE  \cr
ede(x,y,0) for EDE method, see \code{\link{ede}} & iterative version \code{\link{bede}} for BEDE   \cr
findiplist(x,y,0) for both ESE and EDE methods, see \code{\link{findiplist}} \cr

From version 1.3.5 it is also available the implementation of Unit Invariant Knee (UIK) method for the determination 
of elbow or knee point of a curve. That is extremely useful in a wide range of analyses every time we want to find the optimal number of 'components' from a scree plot (PCA: components, Archetypal Analysis: archetypes, Factor A.: factors,  Cluster A..: clusters and so on). In most of the cases uasage is uik(x,y), with x the vector of components, archetypes, clusters, factors or whatever and y the relevant vector Sum of Squared Errors (SSE), see \code{\link{uik}} and \code{\link{d2uik}}.

The methods are defined at [1] & [2] while a detailed reproduction of all Tables for [1] exist in a vignette. All relevant Tables exist as data, for example 
to load Table 1 of [1] we just use data("table_01"). 
}
\author{
Demetris T. Christopoulos
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} \cr

[3]Demetris T. Christopoulos (2016). Introducing Unit Invariant Knee (UIK) As an Objective Choice for Elbow Point in Multivariate Data Analysis Techniques (March 1, 2016). \url{http://dx.doi.org/10.2139/ssrn.3043076} 
}
\seealso{
\code{\link{ese}}, \code{\link{bese}}, \code{\link{ede}}, \code{\link{bede}}, \code{\link{findiplist}}, \code{\link{findipiterplot}}
}
\examples{
#
## Lets create some convex/concave data based on the Fisher-Pry model
##by using 1001 not equal spaced abscissas with data right asymmetry
N=20001;
## Case I: not noisy data
#
set.seed(20190628);
x=sort(runif(N,0,15));y=5+5*tanh(x-5);
#
# t1=Sys.time();
# tese=ese(x,y,0,doparallel = TRUE);#...simple run of ESE
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
## Time difference of 6.023056 secs
# tese;
##       j1   j2      chi
## ESE 4573 8272 4.834904
tede=ede(x,y,0);tede;#...simple run of EDE
##       j1   j2      chi
## EDE 4418 8867 5.000198
edeci(x,y,0);#...Run EDE and compute 95% Chebyshev c.i.
##       j1   j2      chi k  chi-5*s chi+5*s
## EDE 4418 8867 5.000198 5 4.994605 5.00579
#
# t1=Sys.time();
# eseit=bese(x,y,0,doparallel = TRUE);#...Bisection ESE (BESE)
# t2=Sys.time();
# print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
## Time difference of 6.262982 secs
#eseit$iplast #...last estimation for inflection point
## [1] 5.000773
#eseit$iters #...all iterations done...
#        n            a         b      ESE
# 1  20001 0.0001931784 14.999900 4.835303
# 2   3668 4.4606627093  5.647031 5.053847
# 3   1567 4.6878642635  5.262619 4.975242
# 4    737 4.8696049280  5.154673 5.012139
# 5    376 4.9229470803  5.064312 4.993629
# 6    181 4.9684872106  5.038649 5.003568
# 7     82 4.9806225684  5.015416 4.998019
# 8     35 4.9924177257  5.009629 5.001023
# 9     20 4.9960624950  5.002740 4.999401
# 10    11 4.9980399851  5.001968 5.000004
#
t1=Sys.time();
edeit=bede(x,y,0);#...Bisection EDE (BEDE)
t2=Sys.time();
print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 0.073102 secs
edeit$iplast #...last estimation for inflection point
## [1]  4.999941
edeit$iters #...all iterations done
##        n            a         b      EDE
## 1  20001 0.0004635123 14.999801 5.000198
## 2   4450 4.1996716394  5.799961 4.999816
## 3   2129 4.5614927786  5.438346 4.999920
## 4   1182 4.7512642248  5.249931 5.000597
## 5    656 4.8580908542  5.143351 5.000721
## 6    365 4.9175169028  5.082218 4.999868
## 7    229 4.9524894403  5.047898 5.000194
## 8    135 4.9723928177  5.027658 5.000025
## 9     77 4.9835896748  5.016056 4.999823
## 10    46 4.9904827878  5.009340 4.999912
## 11    28 4.9945713510  5.005444 5.000008
## 12    15 4.9968973151  5.003045 4.999971
## 13    11 4.9978968780  5.001986 4.999941
# t1=Sys.time();
# A=findiplist(x,y,0,doparallel=TRUE);#...Run both ESE & EDE at once...
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
## Time difference of 5.143354 secs
#A
##       j1   j2      chi
## ESE 4573 8272 4.834904
## EDE 4418 8867 5.000198
## Let's plot some interesting approximately results.
# plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,x[N]));
# lines(c(x[1],x[A[1,2]]),c(y[1],y[A[1,2]]),col="green",lty=2);
# lines(c(x[N],x[A[1,1]]),c(y[N],y[A[1,1]]),col="blue",lty=2);
# lines(c(x[1],x[N]),c(y[1],y[N]),col="black",lty=2);
# abline(v=A[,3],col=c('blue','red'),lty=2);
# points(x[A[1,1:2]],y[A[1,1:2]], type = "p",pch = 19,col="blue",font=2);
# points(x[A[2,1:2]],y[A[2,1:2]], type = "p",pch = 19,col="red",font=2);
# text(A[1,3]-0.5,0,expression(chi[S]),font=2,col='blue');
# text(A[2,3]+0.5,0,expression(chi[D]),font=2,col='red');
# grid();
#
### Case II: noisy data
#
set.seed(20190628);
x=sort(runif(N,0,15));
r=0.1;y=5+5*tanh(x-5)+rnorm(N,0,0.05);
#
# t1=Sys.time();
# tese=ese(x,y,0,doparallel = TRUE);#...simple run of ESE
# t2=Sys.time();
# print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
## Time difference of 4.878437 secs
#tese
##       j1   j2      chi
## ESE 4684 8412 4.936269
tede=ede(x,y,0);tede;#...simple run of EDE
#       j1   j2      chi
# EDE 4190 8856 4.909071
edeci(x,y,0);#...Run EDE and compute 95% Chebyshev c.i.
##       j1   j2      chi k  chi-5*s  chi+5*s
## EDE 4190 8856 4.909071 5 4.659396 5.158746
# t1=Sys.time();
# eseit=bese(x,y,0,doparallel = TRUE);#...Bisection ESE (BESE)
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
## Time difference of 6.288019 secs
#eseit$iplast#...last estimation for inflection point
## [1] 4.94072
#eseit$iters#...all iterations done...
##       n            a         b      ESE
## 1 20001 0.0004635123 14.999801 4.936269
## 2  3729 4.4285049755  5.538487 4.983496
## 3  1475 4.7297708667  5.413794 5.071782
## 4   932 4.7838335764  5.097607 4.940720
#
t1=Sys.time();
edeit=bede(x,y,0);#...Bisection EDE (BEDE)
t2=Sys.time();
print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
## Time difference of 0.01700807 secs
edeit$iplast#...last estimation for inflection point
## [1] 5.071782
edeit$iters#...all iterations done
##       n            a         b      EDE
## 1 20001 0.0004635123 14.999801 4.909071
## 2  4667 4.2343777127  5.704010 4.969194
## 3  1938 4.7297708667  5.413794 5.071782
#
# t1=Sys.time();
# A=findiplist(x,y,0,doparallel=TRUE);#...Run both ESE & EDE at once...
# t2=Sys.time();
# print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
## Time difference of 5.037386 secs
#A
##       j1   j2      chi
## ESE 4684 8412 4.936269
## EDE 4190 8856 4.909071
#
## Let's plot some interesting approximately results.
# plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,x[N]));
# lines(c(x[1],x[A[1,2]]),c(y[1],y[A[1,2]]),col="green",lty=2);
# lines(c(x[N],x[A[1,1]]),c(y[N],y[A[1,1]]),col="blue",lty=2);
# lines(c(x[1],x[N]),c(y[1],y[N]),col="black",lty=2);
# abline(v=A[,3],col=c('blue','red'),lty=2);
# points(x[A[1,1:2]],y[A[1,1:2]], type = "p",pch = 19,col="blue",font=2);
# points(x[A[2,1:2]],y[A[2,1:2]], type = "p",pch = 19,col="red",font=2);
# text(A[1,3]-0.5,0,expression(chi[S]),font=2,col='blue');
# text(A[2,3]+0.5,0,expression(chi[D]),font=2,col='red');
# grid();
## Close device
#dev.off()
##
## Load data used for Tables of [1]
data("table_01")
dh=table_01
plot(dh,pch=19,cex=0.1)
A=findiplist(dh$x,dh$y,0) 
A
abline(v=A[1,3],col='blue')
abline(v=A[2,3],col='red')
##
}
\keyword{inflection}