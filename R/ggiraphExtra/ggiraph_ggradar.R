require(ggplot2)
require(ggiraph)
require(ggiraphExtra)
require(plyr)
require(reshape2)
require(moonBook)
require(sjmisc)


ggRadar(data=iris,aes(group=Species))

# mtcars interactive
ggRadar(data=mtcars,interactive=TRUE)

# mtcars interactive
ggRadar(data=mtcars,aes(colour=am,facet=cyl),interactive=TRUE)


# Facet y color
ggRadar(data=acs,aes(colour=Dx,facet=Dx))

ggRadar(iris,aes(x=c(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)))
