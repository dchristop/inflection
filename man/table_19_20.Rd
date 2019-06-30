\name{table_19_20}
\alias{table_19_20}
\docType{data}
\title{
A 3rd order polynomial with data right symmetry and error ~ U(-2,2)
}
\description{
Data used for creating Table 19 and 20 of arXiv:1206.5478v2
}
\usage{data("table_19_20")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 19: Symmetric 3rd order polynomial, data right asymmetry, p=2.5, n=500, [-2, 8], error r=2.0

Table 20: ESE & EDE iterations for 3rd order polynomial, p=2.5, n=500, [-2, 8], error r=2.0
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_19_20")
dh=table_19_20
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
bede(dh$x,dh$y,0)
}
\keyword{datasets}
