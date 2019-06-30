\name{table_17_18}
\alias{table_17_18}
\docType{data}
\title{
A 3rd order polynomial with data right symmetry and no error
}
\description{
Data used for creating Table 17 and 18 of arXiv:1206.5478v2
}
\usage{data("table_17_18")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 17: Symmetric 3rd order polynomial, data right asymmetry, p=2.5, n=500, [-2, 8], no-error

Table 18: ESE & EDE iterations for 3rd order polynomial, p=5, p=2.5, n=500, [-2, 8], no-error
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_17_18")
dh=table_17_18
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
bede(dh$x,dh$y,0)
}
\keyword{datasets}
