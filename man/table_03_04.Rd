\name{table_03_04}
\alias{table_03_04}
\docType{data}
\title{
 Fisher-Pry sigmoid with data left asymmetry and no error
}
\description{
Data used for creating Table 3 and 4 of arXiv:1206.5478v2
}
\usage{data("table_03_04")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 3: Fisher-Pry sigmoid, p=5, data left symmetry, [a, b] = [4.2, 8], n=500, no error

Table 4: ESE & EDE iterations for Fisher-Pry sigmoid, p=5, data left asymmetry, [a, b] = [4.2, 8], n=500, no-error
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_03_04")
dh=table_03_04
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
bede(dh$x,dh$y,0)
}
\keyword{datasets}
