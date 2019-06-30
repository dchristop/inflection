\name{table_10_11}
\alias{table_10_11}
\docType{data}
\title{
Gompertz non-symmetric sigmoid with error ~ U(-0.05,0.05)
}
\description{
Data used for creating Table 10 and 11 of arXiv:1206.5478v2
}
\usage{data("table_10_11")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 10: Gompertz sigmoid, p=5, asymmetry, [a, b] = [3.5, 8], n=500, error r=0.05

Table 11: ESE & EDE iterations for Gompertz sigmoid, p=5, asymmetry, [a, b] = [3.5, 8], n=500, error r=0.05
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_10_11")
dh=table_10_11
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
bede(dh$x,dh$y,0)
}
\keyword{datasets}
