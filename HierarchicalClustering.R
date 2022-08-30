# Hierarchical Clustering

# Load Packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr,
               lubridate, plotly, rio, rmarkdown, shiny, stringr, tidyr)

library(datasets) # Load base packages manually

### Load Data ################################################################

?mtcars
head(mtcars)
cars <- mtcars[, c(1:4, 6:7, 9:11)] # Select variables
head(cars)

### Compute and Plot Clusters ################################################

# Save hierarchical clustering into 'hc'. This code uses
# pipes from dplyr.
hc <- cars %>% # Get cars data
      dist %>% # Compute distance/dissimilarity matrix
      hclust   # Computer hierarchical clusters
plot(hc)

# Add boxes to plot
rect.hclust(hc, k=2, border='gray')
rect.hclust(hc, k=3, border='blue')
rect.hclust(hc, k=4, border='green4')
rect.hclust(hc, k=5, border='darkred')