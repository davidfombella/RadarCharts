devtools::install_github("ricardo-bion/ggradar",dependencies = TRUE)

library(ggradar)
library(dplyr)
library(scales)
library(tibble)

mtcars_radar <- mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  select(1:10)


ggradar(mtcars_radar)




# Custom fonts


# configured to work on a Mac, change directory to Unix or Windows
download.file("https://github.com/ricardo-bion/ggtech/blob/master/Circular%20Air-Light%203.46.45%20PM.ttf", "~/Circular Air-Light 3.46.45 PM.ttf", method = "curl")

extrafont::font_import(pattern = 'Circular', prompt = FALSE)

mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  select(1:10) %>% 
  ggradar(font.radar = "Circular Air")