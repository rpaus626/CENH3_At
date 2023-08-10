# Set directory

setwd('/home/rpaus/Documents')

# Reading different file types

# PLACEHOLDER_NAME <- read.csv('FILE_NAME')
# PLACEHOLDER_NAME <- read.table('FILE_NAME', header=TRUE)

library(tidyr)

library(ggplot2)


# Template for plots and functions

# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>, 
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>

# Example for using ggplot and geom function

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  scale_x_continuous(breaks = seq(0, 7, by = 0.5)) +
  theme_bw() +
  theme(legend.position = 'top') +
  guides(color = guide_legend(nrow = 1, override.aes = list(size = 3))) +
  scale_color_brewer(palette = 'Set1') +
  coord_cartesian(xlim = c(2, 4), ylim = c(20, 30))


# First data analysis of a day 5 leaf

Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table <- read.csv('Day5_Leaf_CENH3_01_1024x1024_40x_N11-data_table.csv')

# Create new column for concentration by dividing the intensity with the size

Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table$concentration_0 <- Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table$Total.Intensity_0/Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table$Size.in.pixels

Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table$concentration_1 <- Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table$Total.Intensity_1/Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table$Size.in.pixels

# Creating box plots for intensity, size and concentration sorted by class

png(file = "example_boxplot_size_rstudio_midres.png", width = 960, height = 960)

ggplot(Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table, aes(x = Predicted.Class, y = Size.in.pixels, color = Predicted.Class)) +
  geom_boxplot()

dev.off()

# Creating a scatter plot to show relationship between intensity and volume

png(file = "example_scatterplot_smooth_rstudio_midres.png", width = 1920, height = 960)

ggplot(Day5_Leaf_CENH3_01_1024x1024_40x_N11_data_table) +
  geom_point(mapping = aes(x = Size.in.pixels, y = Total.Intensity_1, color = Predicted.Class)) +
  geom_smooth(aes(x = Size.in.pixels, y = Total.Intensity_1)) +
  facet_wrap(~ Predicted.Class)

dev.off()
