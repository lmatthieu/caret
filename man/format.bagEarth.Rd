\name{format.bagEarth}
\alias{format.bagEarth}
\title{Format 'bagEarth' objects}
\description{
Return a string representing the \sQuote{bagEarth} expression.
}
\usage{
\method{format}{bagEarth}(x, file = "", cat = TRUE, \dots)
}
\arguments{
  \item{x}{
    An \code{\link{bagEarth}} object.
    This is the only required argument.
  }
  \item{file}{A connection, or a character string naming the file to print to. If "" (the default), the output prints to the standard output connection. See \code{link[base]{cat}}.}

  \item{cat}{a logical; should the equation be printed?}

  \item{\dots}{
     Arguments to \code{\link[earth]{format.earth}}.
  }
}
\value{
A character representation of the bagged earth object.
}
\seealso{
  \code{\link[earth]{earth}}
}

\examples{
a <- bagEarth(Volume ~ ., data = trees, B= 3)
cat(format(a))

# yields:
# (
#   31.61075 
#   +  6.587273 * pmax(0,  Girth -   14.2) 
#   -  3.229363 * pmax(0,   14.2 -  Girth) 
#   - 0.3167140 * pmax(0,     79 - Height) 
#   +
#    22.80225 
#   +  5.309866 * pmax(0,  Girth -     12) 
#   -  2.378658 * pmax(0,     12 -  Girth) 
#   +  0.793045 * pmax(0, Height -     80) 
#   - 0.3411915 * pmax(0,     80 - Height) 
#   +
#    31.39772 
#   +   6.18193 * pmax(0,  Girth -   14.2) 
#   -  3.660456 * pmax(0,   14.2 -  Girth) 
#   + 0.6489774 * pmax(0, Height -     80) 
# )/3

}
\keyword{models}
