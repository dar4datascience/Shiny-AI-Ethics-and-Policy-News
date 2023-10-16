library(dplyr)
library(ggplot2)

generate_and_save_plots <- function(num_plots = 3, plot_folder = "my_plots") {
  # Check if the plot folder exists, and create it if not
  if (!dir.exists(plot_folder)) {
    dir.create(plot_folder)
  }
  
  # Loop through the specified number of plots
  for (i in 1:num_plots) {
    # Generate random data for the scatter plot
    set.seed(i)
    num_points <- sample(10:100, 1)
    data <- data.frame(
      x = rnorm(num_points),
      y = rnorm(num_points)
    )
    
    # Create a scatter plot
    scatter_plot <- ggplot(data, aes(x, y)) +
      geom_point() +
      labs(title = paste("Scatter Plot", i))
    
    # Generate random data for the bar plot
    num_categories <- sample(3:6, 1)
    category_names <- sample(letters, num_categories)
    category_values <- sample(10:50, num_categories)
    bar_data <- data.frame(
      category = category_names,
      value = category_values
    )
    
    # Create a bar plot
    bar_plot <- ggplot(bar_data, aes(x = category, y = value)) +
      geom_bar(stat = "identity") +
      labs(title = paste("Bar Plot", i))
    
    # Create random data for the pie plot
    pie_data <- data.frame(
      category = category_names,
      value = category_values
    )
    
    # Create a pie plot
    pie_plot <- ggplot(pie_data, aes(x = "", y = value, fill = category)) +
      geom_bar(stat = "identity") +
      coord_polar(theta = "y") +
      labs(title = paste("Pie Plot", i))
    
    # Define filenames for saving plots
    scatter_file <- file.path(plot_folder, paste("scatter_plot_", i, ".png", sep = ""))
    bar_file <- file.path(plot_folder, paste("bar_plot_", i, ".png", sep = ""))
    pie_file <- file.path(plot_folder, paste("pie_plot_", i, ".png", sep = ""))
    
    # Save plots as PNG files
    ggsave(scatter_file, plot = scatter_plot)
    ggsave(bar_file, plot = bar_plot)
    ggsave(pie_file, plot = pie_plot)
  }
}

# Call the function to generate and save plots
generate_and_save_plots(num_plots = 3)
