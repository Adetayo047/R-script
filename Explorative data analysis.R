## Improved data viz

library(ggplot2)

# relation bw Sepal length and width of 3 different species
qplot(Sepal.Length, Petal.Length, data = iris, color = Species)

# We see that Iris setosa flowers have the narrowest petals.
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)

##Add labels to the plot

qplot(Sepal.Length, Petal.Length, data = iris, color = Species,
      xlab = "Sepal Length", ylab = "Petal Length",
      main = "Sepal vs. Petal Length in Iris data")

# Plot the number of movies each director has.
qplot(Species, data = iris, geom = "bar", ylab = "Samples/species")

library(devtools)
install_github("ujjwalkarn/xda")

library(xda)

data(iris)
head(iris)

        ################summarize the quantitative data################

numSummary(iris)
## n = total number of rows for that variable
## miss = number of rows with missing value
## miss% = percentage of total rows with missing values ((miss/n)*100)
## 5% = 5th percentile value of that variable (value below which 5 percent of the observations may be found)
## the percentile values are helpful in detecting outliers
## unique = number of unique levels of that variable
## note that there is only one character column (Species) in the iris dataset

bivariate(iris,'Species','Sepal.Length')

Plot(iris,'Petal.Length') #plot petal.lnegth with other numerical 
#variables and variation in PL across 3 species 


#summarize the qualitative data
charSummary(iris)
## n = total number of rows for that variable
## miss = number of rows with missing value
## miss% = percentage of total rows with missing values ((n/miss)*100)
#############################################################