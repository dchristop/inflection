\name{lin2}
\alias{lin2}
\title{Linear function defined from two planar points (x1,y1) and (x2,y2)
}
\description{It gives the value of the linear function defined from two points (x1,y1) and (x2,y2) at any x 
}
\usage{
lin2(x1, y1, x2, y2, x)
}
\arguments{
  \item{x1}{the x - abscissa of the first point
}
  \item{y1}{the y - ordinate of the first point
}
  \item{x2}{the x - abscissa of the second point
}
  \item{y2}{the y - ordinate of the second point
}
  \item{x}{the x - point where we compute the value of the linear function
}
}
\value{It returns the value of the linear function from (x1,y1) to (x2,y2) at an arbitrary x. 
}
\author{Demetris T. Christopoulos.
}
\note{The value of a linear function is built by this way for R to be faster than a two-vectors call.
}
\examples{
x1<-1
y1<-3
x2<-5
y2<-7
x<-10
ylin<-lin2(x1,y1,x2,y2,x)
print(ylin)
}
\keyword{line}