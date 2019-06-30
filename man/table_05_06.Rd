\name{table_05_06}
\alias{table_05_06}
\docType{data}
\title{
Fisher-Pry sigmoid with data left asymmetry and no error ~ U(-0.05,0.05)
}
\description{
Data used for creating Table 5 and 6 of arXiv:1206.5478v2
}
\usage{data("table_05_06")}
\format{
  A data frame with 501 observations on the following 2 variables.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
Table 5: Fisher-Pry sigmoid, p=5, data left symmetry, [a, b] = [4.2, 8], n=500, error r=0.05

Table 6: ESE & EDE iterations for Fisher-Pry sigmoid, p=5, data left asymmetry, [a, b] = [4.2, 8], n=500, error r=0.05
}
\references{
Christopoulos, DT (2014). Developing methods for identifying the inflection point of a convex/concave curve. arXiv:1206.5478v2 [math.NA]
}
\examples{
data("table_05_06")
dh=table_05_06
plot(dh,pch=19,cex=0.1)
findiplist(dh$x,dh$y,0)
bese(dh$x,dh$y,0)
bede(dh$x,dh$y,0)
}
\keyword{datasets}
