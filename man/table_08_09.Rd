\name{table_08_09}
\alias{table_08_09}
\docType{data}
\title{
Gompertz non-symmetric sigmoid with no error
}
\description{
Data used for creating Table 8 and 9 of arXiv:1206.5478v2
}
\usage{data("table_08_09")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 8: Gompertz sigmoid, p=5, asymmetry, n=500, no-error

Table 9: ESE & EDE iterations for Gompertz sigmoid, p=5, asymmetry, [a, b] = [3.5, 8], n=500, no error
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_08_09")
dh=table_08_09
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
bede(dh$x,dh$y,0)
}
\keyword{datasets}
