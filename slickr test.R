# Load required libraries
library(htmlwidgets)
library(slickR)
library(fs)
library(purrr)
library(svglite)

# Load slickR object for displaying NBA player logos
slickR(obj = nba_player_logo$uri,
       height = 100,
       width = "95%")

# Load all plots from the 'my_plots' folder and prepare their names
my_plots <- dir_ls('my_plots')
plot_names <- map_chr(1:9, \(x) paste("Plot number", x))

# Create a synchronized slickR carousel with plots
slickR(obj = my_plots,
       height = 800,
       width = "95%") %synch%
  (slickR(plot_names, slideType = 'p') + settings(arrows = FALSE))

# Create a slickR carousel for scrolling plots upwards
slick_up <- slickR(my_plots, height = 200, width = "95%") +
  settings(slidesToShow = 1, slidesToScroll = 1)

# Create a slickR carousel for scrolling plots downwards
slick_down <- slickR(my_plots, height = 100, width = "95%") +
  settings(
    slidesToScroll = 1,
    slidesToShow = 5,
    centerMode = TRUE,
    focusOnSelect = TRUE,
    arrows = FALSE
  )

# Synchronize the upward and downward scrolling carousels
slick_up %synch% slick_down
