 ### Data Wrangling #######
#Data wrangling also known as data cleaning or data munging is the process of cleaning and unifying messy 
#and complex data sets for easy access and analysis.

###enables businesses to tackle more complex data in less time, 
##produce more accurate results, and make better decisions. The exact methods 
##vary from project to project depending upon your data and the goal you are trying to achieve

#With the amount of data and data sources rapidly growing and expanding, 
#it is getting increasingly essential for large amounts of available data to be organized for analysis.

### The core categories of data wrangling with R include data extraction, 
#data cleansing, data transformation, and data consolidation

######## Importance of Data Wrangling #########
#1. Making raw data usable
#2. Getting all data from various sources into a centralized location so it can be used.
#3. joining data together and understanding the business context of data
#4. Cleansing the data from the noise or flawed, missing elements
#5. Helping business users make concrete, timely decisions


#### DATA MANIPULATION USING TIDYVERSE

# The tidyverse is a powerful collection of R packages that
# are actually data tools
#for transforming and visualizing data.

#to know more about tidyverse you can visit the documentation 
#https://www.tidyverse.org/packages/
?tidyverse

#the core packages are:
#1. gglot2: it is for visualization, it implements the grammar of graphics

#2. dplyr: it is a grammar of data manipulation. you can use it to solve alot of 
# data manipulation challenges

#3. tidyr: it helps you to create tidy data. where each variable is a column and 
# each observation or cases is a row,and each value is a cell

#4. Readr:it is a fast and friendly way to read rectangular data

#5. Purr: it enhances R functional Programming tool kit by 
#providing a complete and consistent set of tools for working with functions 
#and vector

#6. Tibble: A model Reimagining of data frame yet in columns ans row a
# reimmaging means doing something in another way

#7. stringr: provides a cohensive sets of function designed to make working 
#restraint as easy as posiible

### to check the documentation of tidyverse in r studio
?tidyverse
?datasets

#to install packages we use
library(help = "datasets")
install.packages("gapminder")

library(datasets)
library(tidyverse)
library(gapminder) 
# it is a package in r that is mostly used
#
#for teaching data wrangling 
# and visualization 

# to view packages
attach(iris)
view(iris)

?iris
                  ###############################################################
                    #######################  creating Tables   ################
# put data in Tibble, it makes it much easier to work with large data and for subsetting 
# use co2 inbulit dataset 
# in R as Tibble builds columns sequentially. When defining a column,
# you can refer to columns created earlier in the call

co2_tibble <- as_tibble(CO2)
co2_tibble
view(co2_tibble)
dim(co2_tibble)

?CO2

#Using the view method
view(co2_tibble)

head(co2_tibble)
#Using the print method
print(co2_tibble, n=Inf)# display only 20 observations

#instead of using 'print' and 'view'  ti display your 
#data you can use head()


#######################################################################
    ####### Build and print Tibbles using tidyverse#########

name <- c("mr_stev","mr_ife","miss_opemipo","miss_feyi","mrs_abike")
birthyear <- c("1982","1984","1983","1987","1880")
eyecolor <- c("black","golden","blue","red","golden")
people  <-  tibble(name,eyecolor,birthyear)
print(people)


            ####### Selecting Rows and Columns#############
senior <- people[1:3, c(1,3)] 
senior # selecting the from 1-3 rows and 1 and 3 columns

junior <-  people[c(2,3,4:5), 1:2]
junior

ass <- people[c(2,5), c(1,2)]
ass

ass2 <- people[c(1,3,5), c(1,3)]
ass2

                  #########Sub-setting Tibbles##########
#When we subset a tibble, we extract a single variable
#from that tibble in the form of a vector
#Use the '$' sign operator or we can use th '[]' to sub-set, 
#'[]' always returns a tibble by default, even if only one column is accessed.

people$eyecolor # it will return a vector bcs the different cols in a data are vectors

unique(people$eyecolor) # to print without duplicate values 

unique(iris$Species)

iris$Species

people["eyecolor"] 

# returns a tibble
people[["eyecolor"]]
#returns a vector
# Using the square bracket method (a list)

          ######### Retreiving data Using indexing########
people[[1]] # very short form of retreiving data in a column using indexing

philip <- people[[2]]
people

unique(philip)

              ################# Filtering tables##########################
##Create new tibble into it's own only individauls
# with Golden eyes
GoldenEyes <- filter(people, eyecolor=="golden")
GoldenEyes

###Extract only people with birth year greater than 
##2003

birth <- filter(people, birthyear>2003)
birth
## Extract  those with red eye  with birthyear

filter(people, eyecolor=="red" & birthyear>2002)


                      ######### class-work ##########
#### Create a tibble of Datalab intern student seated in the R class and populate the tibble
## with surname, state of origin, Highest qualification, and marital status

Dlabstudname <- c("Adetunji","Aluko","Akila","Ben","Yusuf", "Feyi")
Dlabqualification <- c("BSC","SSCE","BSC","BSC","BSC", "SSCE")
Dlabstudstate <- c("Oyo","Ondo","Ibom","Ekiti","Enugu", "cross-river")
DlabstudStatus <- c("Single","Single","Single","Single","Single", "Single")
Dlabstudweight_kg <- c("60","70","70","92","60", "78")
Dlabstud <- tibble(Dlabstudname,Dlabstudstate,Dlabqualification,DlabstudStatus,Dlabstudweight_kg)
Dlabstud

# filter student with BSC
filter(Dlabstud, Dlabqualification=="BSC")

filter(Dlabstud, Dlabqualification=="BSC" & Dlabstudweight_kg>=60)

filter(Dlabstud, Dlabstudname>"A" | DlabstudStatus=="married")

##### FURTHER EXAMPLES########
data("mtcars")
data('iris')

irisdata <- iris #
head(irisdata, n=10) ## to return the first 10 rows

# without specifying the row by default it brings out 6 rows


mydata <- mtcars
head(mydata)

?mtcars
# put data in tibble to make it more  easier
# to work with large data and subsetting

mynewcars <- as_tibble(mydata)

mynewiris <- as_tibble(iris)

view(mynewcars) # view dataset

view(mynewiris)  #view dataset




#use  filter to filter data with required condition

filter(mynewcars, cyl > 4 & gear > 4)


filter(mynewcars, cyl > 4)

filter(mynewiris, Species %in% c('setosa', 'virginica'))

filter(mynewiris, Species == c('virginica','setosa')) #assignment

#use select to pick columns by names
select(mynewcars, cyl, mpg, hp)

mynewcars
#Where you can use (-) to hide columns
select(mynewcars, -cyl, -mpg)

#hide a range of columns
select(mynewcars, -c(cyl,mpg))

#select series of column
select(mynewcars, cyl:gear)

        #########chaining or pipelining - a way to perform multiple option##############

mynewcars %>%
  select(cyl,wt,gear)%>%
  filter(wt > 2)


          #####Arrange can be used to re-order rows #####
fil <- mynewcars%>%
  select(cyl,wt,gear)%>%
  arrange(desc(wt))%>%
  filter(wt>3)
fil

        ########### Creating the CSV file ###########

write.csv(fil,"fill.csv")
fwrite(mydata, "car_data.csv")

      ######## View the file that was saved in the current directory ########
list.files(".", pattern = "fill*")
# [1] "car_data.csv"

              ######### Reading the CSV file ########
read.csv("fill.csv") # Base R
read_csv("car_data.csv") # Tidyverse
fread("car_data.csv")    # data.table

      ############ when importing data from a working directory of file ########
data = read_csv("C:\\Users\\user\\OneDrive\\Desktop\\DATALAB\\r class\\data\\Ch3_marketing.csv")
data

getwd() #to get working directory
setwd("C:\\Users\\user\\OneDrive\\Desktop\\DATALAB\\r class\\data\\")#set working directory
data1 = read_csv("Ch4_marketing.csv")
data1
          ############# mutate - create new variables ###########

datc <- mynewcars %>%
  select(mpg,cyl) %>%
  mutate(philip = mpg*cyl)

datc
?mean

##Summarrise  - this is use to find insight from data
mynewiris %>%
  group_by(Species) %>%
  summarise(Average = mean(Sepal.Length, na.rm = TRUE))


### YOU CAN RENAME A VARRIABLE USING THE RENAME COMMAND
mynewcars %>%
  rename(miles = mpg,cylinder =cyl)



### Assignment ####
filter(Dlabstud, Dlabstudname>="E")
#or
Dlabstud$Dlabstudname%>%
  str_subset("A", negate = TRUE)

?str_subset

#to rename the weight column to mass
Dlabstud%>%
  rename(mass = Dlabstudweight_kg)

#interns whose weight are between 60kg and 85kg
Dlabstud%>%
  filter(Dlabstudweight_kg>=60 & Dlabstudweight_kg<= 85)

#interns whose state of origin is cross  river, whose are not single 
#and whose weight exceed 65kg
Dlabstud%>%
  filter(Dlabstudstate=='cross-river', DlabstudStatus =='married' , Dlabstudweight_kg > 65)




################################### 9/10/2021 ########################################################

####  Summaries Cases ########
#Apply summaries function to column to create new table of summary statistics
#Summaries function take vector as output and return value



summarise(mynewcars, avg = mean(mpg, na.rm = TRUE))

#### OR

mynewcars$mpg %>%
  mean()

### OR

mean(mynewcars$mpg, na.rm = TRUE)


count(mynewcars, cyl) #count number of rows in each group defined by the variable in cyl

unique(mynewcars$cyl) #check for unique entries 

table(mynewcars$cyl)

###########################################################################################

#### Group Cases####################
## Use group_by to create a grouped copy of a table ##
#grouped by columns in cyl

mynewcars %>%
  group_by(cyl) %>%
  summarise(avg = mean(mpg, na.rm = T)) ### 


##############################################
##  Use  rowwise() to group data into individauls
#rows . dpyr functions will compute
# results for each row. also aapply function to list-columns


attach(starwars)

starwars <- as_tibble(starwars)
view(starwars)
?starwars


starwars %>%
  rowwise() %>%
  mutate(film_count = length(films)) ## we create a new column called films_count

view(starwars)
### It wasn't a permanent manipulation . See this now,

starwars_update <- starwars %>%
  rowwise() %>%
  mutate(film_count = length(films))

view(starwars_update)


######## Manipulate cases##########
 filter(mynewcars, mpg > 20)


## distinct() removes rows with duplicate values
count (mynewcars, gear)

distinct(mynewcars, gear)

## slice() selects rows by position
slice(mynewcars, 10:15)

"C:\Users\user\OneDrive\Desktop\DATALAB\r class\data\Ch3_marketing.csv"# Slice_simple() randomly selects rows. use n to 
# select a number of rows and prop to select a fraction of rows

slice_sample(mynewcars, n=5, replace = TRUE) 

slice_sample(mynewcars, prop = 0.7, replace = T) ### prop means propotion which means the dataset should be  sample by 70% of the dataset


# slice_min and slice_max select rows with the lowest and highest values

slice_min(mynewcars, mpg, prop = 0.25)

slice_max(mynewcars, mpg, prop = 0.25)

# slice_head() and slice_tail() select the first or last rows

slice_head(mynewcars, n=5)
slice_tail(mynewcars, n=5)


?Comparison
?base::Logic


#############################################################################
id <- c('dl01','dl02','dl03','dl04','dl05','dl06')
hobby <- c('reading', 'reading', 'traveling', 'playing games','Music', 'photography')
fav_meal <- c('jollof Rice', 'bitterleafsoup', 'spag', 'miomio','poundedyam','ekpang')
religion <- c('Christian','Christian','Muslim','Christian','Christian','Christian')

dlintern <- tibble(id,hobby,fav_meal,religion)
dlintern

# check out the different kind of hobbies without repetition
distinct(dlintern, hobby)

# sample 65% of your population without replacement
slice_sample(dlintern, prop = 0.65, replace = F)

# WHAT ARE THE DISTINCT RELIGION
distinct(dlintern, religion)

##### Arrange Cases ######
# Arrange() orders rows by values of a column or column(low to high), 
# use with desc() to order from high to low.
?arrange

arrange(mtcars, mpg)

arrange(mtcars, desc(mpg))

######  Add Cases ######
# add_row() adds one or more rows to a table
attach(cars)

view(cars)

add_row(cars, speed = 1, dist = 1)

#### Add Variables ####
df <- tibble(x = 1:3, y=3:1)
df

df %>% add_column(z = -1:1, w = 0)
df %>% add_column(z = -1:1, .before = "y")
df %>% add_column(z = -1:1, .after = "y")
df%>% add_column(z = -1:1, before = "y")


######  manipulate Variable  ######

###Extract Variable ####

pull(mynewcars, wt)


mynewcars$wt

#select() extract columns as a table

select(mynewcars, mpg, wt)

mynewcars[c('mpg', 'wt')]

# relocate() moves columns to new position
relocate(mynewcars, mpg, cyl, .after = last_col())

relocate(mynewcars, vs, .before = mpg)


##### Manipulate multiple variables at once #####
summarise(mynewcars, across(everything(), mean))

summarise(mynewcars, across(c(mpg,cyl,vs), median))

### Make New Variables ####
mutate(mynewcars, gpm = 1/mpg)

#computes new column(s), drop others
transmute(mynewcars, gpm = 1/mpg)   

rename(mynewcars, cylinder=cyl)




##################################################################################################
################### Importing Directory into R #################
library(readr)

#### Checking working directory

getwd()


setwd("C:\\Users\\ADETAYO\\Desktop\\DATALAB\\R\\R data")
getwd()

### Making wide data sets long with gather() /pivot_long

pew <- read.csv('pew.csv')
view(pew)

pew_long <- gather(pew, income, freq, -religion)
view(pew_long)


## gather is becoming obsolete and his being replace by pivot_longer
install.packages(bit)

####  Making long data set wide
weather <- read.csv("mexicanweather.csv")

glimpse(weather)
view(weather)


weather.spread <- spread(weather, element, value)
view(weather.spread)

### OR

weather %>%
 pivot_wider(names_from = "element",
              values_from = "value") 




  