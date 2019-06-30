\name{table_13}
\alias{table_13}
\docType{data}
\title{
A 3rd order polynomial with total symmetry and no error
}
\description{
Data used for creating Table 13 of arXiv:1206.5478v2
}
\usage{data("table_13")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 13: 3rd order polynomial, total symmetry, p=2.5, n=500, no-error
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_13")
dh=table_13
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
bede(dh$x,dh$y,0)
}
\keyword{datasets}
