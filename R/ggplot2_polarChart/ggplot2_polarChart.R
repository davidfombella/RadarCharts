# https://www.sportschord.com/post/polar_area_charts_tutorial

# How to make the Polar Area Chart in R

# The second part of this blog will now breakdown how to build the Polar Area chart in R. 
# This assumes a basic knowledge of R, RStudio & how to install packages. 
# The full code to create a relatively unformatted Polar Area Chart is below. 
# See beneath for a line by line description. 
# Replace the bold, coloured metrics with your own data frame. 

library(ggplot2)

#########################################
# REPLACE Metric  Length Player
#########################################

ggplot(data, aes(x=Metric, y=Length)) +

  geom_col(fill = "red", alpha=1, width=1)+

  geom_hline(yintercept = seq(0, 100, by = 10),

             color = "grey", size = 1) +

  geom_vline(xintercept = seq(.5, 16.5, by = 1),

             color = "grey", size = 1) +

  coord_polar()+

  facet_wrap(vars(Player))

# ggplot(data, aes(x=Metric, y=Length)) +

# This line calls the ggplot2 package, binds your data to the plot & allows you to select the 'aesthetics' (aes) that will be used for the visualization. 

# In this case, we want our Metric on the x-axis & Value on the y-axis. 
# Remember, we are creating a column chart right up until the coord_polar command. 

# Use the '+' sign to chain the lines of together. 

# geom_col(fill = "red", alpha=1, width=1)+

# This calls the geom_col function, required for making our column/vertical bar chart. 

# The fill argument sets the fill colour of the columns. Hex codes/RGB can be used here.

# The alpha sets the transparency (0=transparent, 1= opaque).

# The width sets the gap between the columns (0=no bar, 1= touching side by side).

#  geom_hline(yintercept = seq(0, 100, by = 10),
#            color = "grey", size = 1) +

# geom_vline(xintercept = seq(.5, 16.5, by = 1),
#            color = "grey", size = 1) +

#   These lines adds some handy grid lines to our chart.

#  geom_hline sets the circular grid lines, geom_vline sets the segment boundary lines.

# seq() creates a sequence between two numbers, the 'by' argument states the gap. 

# color sets the line colour.

#    size sets the line width.

# coord_polar()+

#   The magic happens here. Switch from Cartesian to Polar coordinates. 

#  facet_wrap(vars(Player))

 #   Use the 'facet' function to get small multiples per a particular metric. Read more on this here.

#All other formatting to the charts, such as adding titles, subtitles, background colours and boxes for the facets can be achieved in the theme(). 
# An example of the theme I created for my Arsenal chart can be found below. 

theme(axis.text.x = element_text(size=25,colour = "#063672" ,

              angle = seq(-20,-340,length.out = 9),vjust = 100),

        axis.text.y = element_blank(),

        axis.ticks.y  = element_blank(),

        axis.ticks.x = element_line(size = 2,colour = "black",linetype = 1),

        legend.position = "none",

        strip.background = element_rect(colour = "black", fill = "#063672"),

        strip.text.x = element_text(colour = "white", face = "plain",size = 45),

        panel.border = element_rect(colour = "black",size = 1,fill=NA),

        panel.spacing = unit(2, "lines"),

        plot.title = element_text(family = "URWGothic",size = 80),

        plot.subtitle = element_text(family = "URWGothic",size = 30),

        plot.caption = element_text(family = "URWGothic",size = 30),

        plot.margin = unit(c(1,1,1,1), "cm"),

        panel.grid = element_blank()

)
