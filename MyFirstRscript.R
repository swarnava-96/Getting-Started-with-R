########## Running my first R script ##########


# Loading data
library(datasets)

# Showing the first six lines of the dataset
head(iris)

# Summary statistics for iris data
summary(iris)

# Scatterplot matrix for iris data
plot(iris)

# Clear packages
detach("package:datasets", unload = TRUE)

# Clear plots
dev.off()

# Clear console
cat("\014")
