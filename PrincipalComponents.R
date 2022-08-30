# Principal Components

# Load Packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr,
               lubridate, plotly, rio, rmarkdown, shiny, stringr, tidyr)

library(datasets) # Load base packages manually

### Load Data ################################################################

?mtcars
head(mtcars)
cars <- mtcars[, c(1:4, 6:7, 9:11)] # Select variables
head(cars)

### Compute PCA ##############################################################

# For entire data frame
pc <- prcomp(cars,
             center=T,   # Centers the means to 0 (optional)
             scale=T)    # Sets unit variance (helpful)

### To specify variables #####################################################

pc <- prcomp(~ mpg + cyl + disp + hp + wt + qsec + am +
             gear + carb,
             data = mtcars,
             center=T,
             scale=T)

### Examin Results ###########################################################
# Get summary
summary(pc)

# Screeplot for number of components  
plot(pc)

# Get standard deviations and rotation
pc

# See how cases load on pc
predict(pc) %>% round(2)

# Biplot of first two components
biplot(pc)
