library(tidyverse)
library(scales)

mtcars_cols <- mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  select(1:10)

mtcars_rows  <- mtcars_cols  %>% gather(key = "Metric", value = "Length", -group)



# Polar chart

ggplot(mtcars_rows, aes(x=Metric, y=Length)) +
  geom_col(fill = "red", alpha=1, width=1)+
  geom_hline(yintercept = seq(0, 100, by = 10),  color = "grey", size = 1) +
  geom_vline(xintercept = seq(.5, 16.5, by = 1), color = "grey", size = 1) +
  coord_polar()+
  facet_wrap(vars(group))



# Polar chart ajustando valores 0 a 1 en lugar de 0 a 100 en hline

ggplot(mtcars_rows, aes(x=Metric, y=Length)) +
  geom_col(fill = "red", alpha=1, width=1)+
  geom_hline(yintercept = seq(0, 1, by = 0.1),  color = "grey", size = 1) +
  geom_vline(xintercept = seq(.5, 16.5, by = 1), color = "grey", size = 1) +
  coord_polar()+
  facet_wrap(vars(group))



# Guardar la imagen
ggsave("mtcars_polarChart.png")





#Con el tema
ggplot(mtcars_rows, aes(x=Metric, y=Length)) +
  geom_col(fill = "red", alpha=1, width=1)+
  geom_hline(yintercept = seq(0, 1, by = 0.1),  color = "grey", size = 1) +
  geom_vline(xintercept = seq(.5, 16.5, by = 1), color = "grey", size = 1) +
  coord_polar()+
  facet_wrap(vars(group))+
theme(axis.text.x = element_text(size=20,colour = "#063672" ,
                                 angle = seq(-20,-340,length.out = 9),vjust = 100),
      
      axis.text.y = element_blank(),
      axis.ticks.y  = element_blank(),
      axis.ticks.x = element_line(size = 2,colour = "black",linetype = 1),
      
      legend.position = "none",
      
      strip.background = element_rect(colour = "black", fill = "#063672"),
      
      strip.text.x = element_text(colour = "white", face = "plain",size = 35),
      
      panel.border = element_rect(colour = "black",size = 1,fill=NA),
      
      panel.spacing = unit(2, "lines"),
      
      plot.title = element_text(family = "URWGothic",size = 18),
      
      plot.subtitle = element_text(family = "URWGothic",size = 15),
      
      plot.caption = element_text(family = "URWGothic",size = 15),
      
      plot.margin = unit(c(1,1,1,1), "cm"),
      
      panel.grid = element_blank()
      
)

