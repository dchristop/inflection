\name{table_14_15}
\alias{table_14_15}
\docType{data}
\title{
A 3rd order polynomial with total symmetry and error ~ U(-2,2)
}
\description{
Data used for creating Table 14 and 15 of arXiv:1206.5478v2
}
\usage{data("table_14_15")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 14: Symmetric 3rd order polynomial, total symmetry, p=2.5, n=500, error r=2.0

Table 15: ESE iterations for 3rd order polynomial, p=2.5, total symmetry, n=500, error r=2.0
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_14_15")
dh=table_14_15
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
}
\keyword{datasets}
