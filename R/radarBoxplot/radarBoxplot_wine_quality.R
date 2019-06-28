library(radarBoxplot)
data("winequality_red")

# Regular
radarBoxplot(quality ~ ., winequality_red)

# Orange and green pattern with white median
orange = "#FFA500CC"
green = rgb(0, .7, 0, 0.6)
radarBoxplot(quality ~ ., winequality_red,
             use.ggplot2=FALSE, medianLine=list(col="white"),
             innerPolygon=list(col=orange),
             outerPolygon=list(col=green))


# Plot in 2 rows and 3 columns
# change columns order (counter clockwise)
radarBoxplot(quality ~ volatile.acidity + citric.acid +
               residual.sugar + fixed.acidity + chlorides +
               free.sulfur.dioxide + total.sulfur.dioxide +
               density + pH + sulphates + alcohol,
             data = winequality_red,
             mfrow=c(2,3))
