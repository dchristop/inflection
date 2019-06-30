\name{findipiterplot}
\alias{findipiterplot}
\title{
A function to show implementation of BESE and BEDE methods by plotting their iterative convergence
}
\description{
We apply the BESE and BEDE methods, we plot results showing the bisection like convergence to the true inflection point. 
One plot is created for BESE and another one for BEDE. If it is possible, then we compute 95\% confidence intervals
for the results. Parallel computing also available under user request.
}
\usage{
findipiterplot(x, y, index, plots = TRUE, ci = FALSE, doparallel = FALSE)
}
\arguments{
  \item{x}{
The numeric vector of x-abscissas, must be of length at least 4.
}
  \item{y}{
The numeric vector of the noisy or not y-ordinates
}
  \item{index}{
If data is convex/concave then index=0 \cr
If data is concave/convex then index=1
}
\item{plots}{
When plots=TRUE the plot commands are executed (default value = TRUE) 
}
  \item{ci}{
When ci=TRUE the 95\% confidence intervals are computed, if sufficient results are available (default value = FALSE) 
}
  \item{doparallel}{
If doparallel=TRUE then parallel computing is applied, based on the available workers of current machine (default value = FALSE)    
}
}
\details{
It applies iteratively when that is theoretically allowable the methods ESE, EDE, stores all useful results and according to 
the input computes 95\% confidence intervals and plots the two sequences (BESE, BEDE).
Useful for a graphical investigation of the inflection point.
}
\value{
\item{ans$first}{The output of first run for ESE and EDE methods}
\item{ans$BESE}{The vector of BESE iterations}
\item{ans$BEDE}{The vector of BEDE iterations}
\item{ans$aesmout}{Mean, Std Deviation and 95 \% confidence interval for all BESE iterations, if possible}
\item{ans$aedmout}{Mean, Std Deviation and 95 \% confidence interval for all BEDE iterations, if possible}
\item{ans$xysl}{A list of xy data frames containing the data used for every ESE iteration}
\item{ans$xydl}{A list of xy data frames containing the data used for every EDE iteration} 
}
\references{
[1]Demetris T. Christopoulos (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]. \url{https://arxiv.org/pdf/1206.5478v2.pdf} \cr

[2]Demetris T. Christopoulos (2016). On the efficient identification of an inflection point.International Journal of Mathematics and Scientific Computing, (ISSN: 2231-5330), vol. 6(1). \url{https://veltech.edu.in/wp-content/uploads/2016/04/Paper-04-2016.pdf} 
}
\author{
Demetris T. Christopoulos
}
\note{
Non direct methods have been removed in version 1.3 due to their limited functionality.
}
\seealso{
See also \code{\link{bese}} and \code{\link{bede}}.
}
\examples{
#
#Lets create some convex/concave data based on the Fisher-Pry model, without noise
f=function(x){5+5*tanh(x-5)};xa=0;xb=15;
set.seed(12345);x=sort(runif(5001,xa,xb));y=f(x);
#
t1=Sys.time();
a<-findipiterplot(x,y,0,TRUE,TRUE,FALSE);
t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
#Time difference of 2.692897 secs
#Lets see available results
ls(a)
# [1] "aedmout" "aesmout" "BEDE"    "BESE"    "first"   "xydl"    "xysl"  
a$first;#Show first solution
#       i1   i2  chi_S,D
# ESE 1128 2072 4.835633
# EDE 1091 2221 4.999979
a$BESE;#Show ESE iterations
#                       1        2        3        4        5        6        7        8
# ESE iterations 4.835633 5.054775 4.978086 5.011331 4.993876 5.003637 4.998145 4.999782
a$BEDE;#Show EDE iterations
#                       1        2        3        4        5        6        7        8        
# EDE iterations 4.999979 4.996327 4.997657 5.001511 4.996464 5.000629 4.999149 4.999885 
#        9       10
# 5.000082 4.999782
a$aesmout;#Statistics and 95%c c.i. for ESE
#                mean      sdev   95%(l)   95%(r)
# ESE method 4.984408 0.0640699 4.930844 5.037972
a$aedmout;#Statistics and 95%c c.i. for EDE
#                mean        sdev   95%(l) 95%(r)
# EDE method 4.999146 0.001753223 4.997892 5.0004
#
#Look how bisection based method (BESE) converges in 8 steps...
#
lapply(a$xysl,summary);
# [[1]]
# x                   y           
# Min.   : 0.006405   Min.   : 0.00046  
# 1st Qu.: 3.802278   1st Qu.: 0.83521  
# Median : 7.583006   Median : 9.94325  
# Mean   : 7.504537   Mean   : 6.68942  
# 3rd Qu.:11.240944   3rd Qu.: 9.99996  
# Max.   :14.994895   Max.   :10.00000  
# 
#...
#
# 
# [[8]]
# x               y        
# Min.   :4.978   Min.   :4.891  
# 1st Qu.:4.988   1st Qu.:4.938  
# Median :5.004   Median :5.018  
# Mean   :4.999   Mean   :4.997  
# 3rd Qu.:5.009   3rd Qu.:5.043  
# Max.   :5.018   Max.   :5.090  
# 
# and BEDE in 10 steps:
#
lapply(a$xydl,summary)
# [[1]]
# x                   y           
# Min.   : 0.006405   Min.   : 0.00046  
# 1st Qu.: 3.802278   1st Qu.: 0.83521  
# Median : 7.583006   Median : 9.94325  
# Mean   : 7.504537   Mean   : 6.68942  
# 3rd Qu.:11.240944   3rd Qu.: 9.99996  
# Max.   :14.994895   Max.   :10.00000  
# 
# ...
# 
# [[10]]
# x               y        
# Min.   :4.982   Min.   :4.911  
# 1st Qu.:4.993   1st Qu.:4.965  
# Median :5.004   Median :5.019  
# Mean   :5.001   Mean   :5.007  
# 3rd Qu.:5.009   3rd Qu.:5.045  
# Max.   :5.018   Max.   :5.090  
#
# See also the pdf plots 'ese_iterations.pdf' and 'ede_iterations.pdf'
}
\keyword{inflection}
\keyword{ese}
\keyword{ede}
\keyword{iterative}
\keyword{bisection}