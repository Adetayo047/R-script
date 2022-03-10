##Dealing with missing values and Na's

## we will be using an inbuilt dataset 'airquality'
data(airquality) 
view(airquality)
str(airquality)

?airquality

head(airquality, n=30)

head(airquality)
summary(airquality)

aq=na.omit(airquality) #remove rows containing NAs
view(aq)
summary(aq)

aq2=airquality[complete.cases(airquality), ] #only retain non-NA rows
head(aq2)
summary(aq2)

## replace NAs with 0
aqty=airquality

aqty[is.na(aqty)]<-0
head(aqty)
summary(aqty)

## replace missing values with average values

meanOzone=mean(airquality$Ozone,na.rm=T)
# remove NAs while computing mean of Ozone
#with na mean value will be na
summary(airquality$Ozone)
aqty.fix=ifelse(is.na(airquality$Ozone),meanOzone,airquality$Ozone)
summary(aqty.fix)


data(mtcars)
str(mtcars)
head(mtcars)

library(help="ggplot2")

library(tidyverse)

p1=qplot(mpg, wt, data = mtcars,
         xlab = "Miles/gallon", ylab = "Weight",
         main = "Miles per gallon vs. Weight")
print(p1)

p2=qplot(Petal.Length,Petal.Width,data=iris,
         xlab="Petal Length",ylab="Petal Width"
         ,main="Sepal Length vs Width")
print(p2)

qplot(Petal.Length,Petal.Width,data=iris,xlab="Petal Length",
      ylab="Petal Width",col=Species)


install.packages("gridExtra")
library(gridExtra)
grid.arrange(p1, p2, ncol=2)


hist(mtcars$mpg)
hist(mtcars$wt)

#Data visualisation
#R has a rich set of inbuilt features to visualize data using a range of chart types. In addition, 
#R also has a range of visualization packages, such as ggplot2 that produce presentation grade 
#graphics used in publications.

?ggplot2

library(help ="ggplot2")

#It is a common practice to visualize a dataset to understand the nature of the individual columns
#of data prior to beginning analysis. Not only does the visualization process shed light on the 
#distribution of the data, but also the contents of the data at a high level.

#Having a visual cue also helps in getting insights more rapidly, relative to having to analyze 
#the data manually. Visualizations help to understand the following:

#1.Distribution of the data
#2.Presence of outliers
#3.Cardinality of the data
#4.Correlated variables
#5.Multivariate relationships

data(iris) #reading the dataset from the inbuilt datas

view(iris)
names(iris) #displaying the columns names


#Types of charts - basic primer
#Some of the commonly used chart types are shown as follows using the standard R functions for 
#data visualization.

#Histograms
#Histograms are used to visualize "count data". The chart consists of bars with a y axis 
#representing the count and the x axis representing the data

##examine data distribution

hist(iris$Sepal.Length) # distribution of a varaibles

#Pros: Histograms can be used to get a general overview quickly from large datasets.

iriss <- select(iris, -Species)

iris

hist(iriss$Sepal.Width)

#Cons:Can only be used for numeric values


#Line plots
#Line plots are usually applied using data along a traditional 
#two-dimensional axes. It is perhaps 
#the most common type of chart that we can see in everyday use. In R, 
#plot with type="l" will create a line chart as shown here:
#relation bw 2 variables
plot(iris$Sepal.Length,iris$Sepal.Width, type = "l")

# Scatter plots
plot(iris$Sepal.Length,iris$Sepal.Width)

#PLOTTING CATEGORICAL VARIABLES
#Boxplots
#Boxplots can be used to get the minimum, median, maximum, and quartiles of the data being plotted.
#Boxplots also help to identify outliers:

boxplot(iris$Sepal.Length,main="5 Stat Summary of iris",xlab="Sepal Length")

#Bar charts
#Bar charts can be used to compare data across a given x axis. Often the x axis could represent 
#a temporal value such as time, date, and so on. It is useful as a visualization to see how 
#quantities changed along a certain timeline or with respect to the variable in the x axis

counts <- table(iris$Species)
counts

barplot(counts, main="Iris Species", xlab="Samples/species")

barplot(counts, main="Iris Species", xlab="Samples/species",horiz=TRUE)

#Heatmaps
#Heatmaps are a simple but effective way to interpret numeric datasets. 
#They work best when the data to be charted (in a heatmap) has been either 
#aggregated or is of a limited size (rows and columns) so that they can be 
#viewed effectively.

install.packages("ggcorrplot") 
install.packages("corrplot")

library(ggcorrplot)
library(corrplot)
head(iris)

myiris = iris[, c(1,2,3,4)]
myiris
hcorr <- cor(myiris) 
hcorr
corrplot(hcorr)

gcorrplot(hcorr,hc.order = T, ggtheme = theme_bw, insig="blank",
           colors = brewer.pal(11,"RdYlGn")[c(1,6,11)]) 



# Shapiro-Wilk normality test for mpg
#H0: data are normally distributed
shapiro.test(mtcars$mpg) 
# Shapiro-Wilk normality test for wt
shapiro.test(mtcars$wt) # => p = 0.09


#Pearson's correlation
cor(mtcars$mpg,mtcars$wt) #default Perason's
cor(mtcars$mpg,mtcars$wt, method="pearson") #specify the method

cor(mtcars$mpg,mtcars$wt, method="pearson",use = "complete.obs")
#in case of NAs being present, specify complete.obs

#is my correlation statistically significant?
#Ho=there is no association between the two variables
cor.test(mtcars$mpg,mtcars$wt)

mydata <- mtcars[, c(1,3,4,5,6,7)]
head(mydata)

library(corrplot)
corr1<-cor(mtcars) #compute multiple correlations
corr1
corrplot(corr1)
corrplot(corr1, method="color")

## ANOTHER CORRELATION

cor(iris$Petal.Length,iris$Petal.Width)

#should I even use Pearson's correlation for iris?
shapiro.test(iris$Petal.Length)

cor(iris$Petal.Length,iris$Petal.Width, method="spearman") 
#spearman's rank method

cor(iris$Petal.Length,iris$Petal.Width, method="kendall") 

#### how to do a map
devtools::install_github("rstudio/leaflet")

library(magrittr)
library(leaflet)
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=77.2310, lat=28.6560, popup="The delicious food of chandni chowk")
m  # Print the map

install.packages("funModeling")
library(funModeling)

df_status(heart_disease)

plot_num(heart_disease)

#profiling_num: Calculating several statistics for numerical variables
#Retrieves several statistics for numerical variables.
profiling_num(heart_disease)

#freq: Getting frequency distributions for categoric variables
library(dplyr)

# Select only two variables for this example
heart_disease_2=heart_disease %>% select(chest_pain, thal)

# Frequency distribution
freq(heart_disease_2)


cross_plot(data=heart_disease, input=c("age", "oldpeak"), target="has_heart_disease")

## [1] "Plotting transformed variable 'age' with 'equal_freq', (too many values). Disable with 'auto_binning=FALSE'"

plotar(data=heart_disease, input = c("age", "oldpeak"), target="has_heart_disease", plot_type="boxplot")

#Density histograms:
plotar(data=mtcars, input = "gear", target="cyl", plot_type="histdens")

library(RColorBrewer)
data(VADeaths)
par(mfrow=c(2,3))
hist(VADeaths,breaks=10, col=brewer.pal(3,"Set3"),main="Set3 3 colors")
hist(VADeaths,breaks=3 ,col=brewer.pal(3,"Set2"),main="Set2 3 colors")
hist(VADeaths,breaks=7, col=brewer.pal(3,"Set1"),main="Set1 3 colors")
hist(VADeaths,,breaks= 2, col=brewer.pal(8,"Set3"),main="Set3 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greys"),main="Greys 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greens"),main="Greens 8 colors")

boxplot(iris$Petal.Length~iris$Species) #Creating Box Plot between two variable


data(iris)
par(mfrow=c(2,2))
boxplot(iris$Sepal.Length,col="red")
boxplot(iris$Sepal.Length~iris$Species,col="red")
boxplot(iris$Sepal.Length~iris$Species,col=heat.colors(3))
boxplot(iris$Sepal.Length~iris$Species,col=topo.colors(3))


#Scatter Plot Matrix can help visualize multiple variables across each other.

plot(iris,col=brewer.pal(3,"Set1"))
install.packages("Rcmdr")
library(Rcmdr)


data(iris, package="datasets")
scatter3d(Petal.Width~Petal.Length+Sepal.Length|Species, data=iris, fit="linear", residuals=TRUE, parallel=FALSE, bg="black", axis.scales=TRUE, grid=TRUE, ellipsoid=FALSE)
