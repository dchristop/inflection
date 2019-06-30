\name{table_02}
\alias{table_02}
\docType{data}
\title{
Fisher-Pry sigmoid with total symmetry and error ~ U(-0.5,0.05)
}
\description{
Data used for creating Table 2 of arXiv:1206.5478v2
}
\usage{data("table_02")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Fisher-Pry sigmoid, p=5, data symmetry, [a, b] = [2, 8], n=500, error r=0.05
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_02")
dh=table_02
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0) 
}
\keyword{datasets}
