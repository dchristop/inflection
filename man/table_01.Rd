\name{table_01}
\alias{table_01}
\docType{data}
\title{
Fisher-Pry sigmoid with total symmetry and no error
}
\description{
Data used for creating Table 1 of arXiv:1206.5478v2
}
\usage{data("table_01")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 1: Fisher-Pry sigmoid, p=5, total symmetry, n=500, no-error
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_01")
dh=table_01
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0) 
}
\keyword{datasets}
