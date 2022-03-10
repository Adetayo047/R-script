######## Introduction to R ############

### Creating Vectors/Variables ########

x<-10:20 # 10 to 20.

x
y<-c(1,2,3,4,5,6,7,8,9,10,11)
y

#### Arithmetic Operations in R ##########
x+y
y<-x+2 #updating 
y
z<-y*3
z
subtotal<-z-6
subtotal

answer<-subtotal/3
answer
x
answer<-((x+2)*3-6)/3
answer

######### Data Types and Assigning data to 
### a vector/variable #####
cards<-c("tiffany","funlola","yemi","makwin","fatimat")
cards

typeof(cards) #character

number<-c(3000,NA,4000,3000,5000)
typeof(number) #double/integer

play<-c(cards,number)
play

typeof(play)


monster<-c(T,T,T,F,T,T,T,T,T)
typeof(monster) #logical/boolean
 
print(monster)
number<-c(number,monster)
typeof(number)
print(number)

coerce.check<-c(play,monster)
coerce.check

x <- 5
y <- 7
ls() # to check the active variables in the 
# global environment
rm(x) #to remove 'x' from the list of variables
ls() # to confirm that 'x' has been removed
number<-c(1,7,6,4,9,10,12,23)
number
print(number)

intern_names<-c("tiffany","funlola","yemi","makwin","fatimat")
print(intern_names)

scores<-c(3000,4000,5000,6000,7000)
scores
names(scores) #checking for column names
names(scores)<-intern_names # making the intern_names the column names
attributes(scores) #returns the column names
names(scores) #confirming if the change has been effected
scores

print(scores)

intern_names<-c("tiffany" = 3000,"funlola"= 4000,"yemi" =5000,"makwin"=6000,"fatimat"=7000)
print(intern_names)

names(name)<-NULL
print(name)

#### Another Method ####
age<-c(21,26,32,31,28)

attributes(age)

names(age)<-c("tiffany","funlola","yemi","makwin","fatimat")
age

#### Descriptive Statistics ###
number
sum(number) 
mean(number)
median(number)
length(number)
sd(number)
var(number)
round(sd(number))

args(sample) #displays the argument list of a function, that is, 
#other parameters that could be used with the function
args(median)
number<-c(3000,NA,4000,3000,5000)
number
median(number)
mean(number)
mean(number,na.rm = TRUE)
median(number,na.rm=TRUE)



### Using Help Function #########
?print
?ls()
?sample

#### Slicing and Indexing a Vector in R ####
age<-c(22,25,28,29,21)
name<-c("tiffany","funlola","yemi","makwin","fatimat")
name[4] #returns the entry in the 4th position
name[-1] #removes entry in the first position, and returns the rest

name[c(1,3,5)] #returns entries in the 1st, 3rd, and 5th position
name[c(-1,-3)] #removes entries in the 1st and 3rd position
name[-c(1,3)] #this is another way of writing the line above

names(age)<-name
age
age["tiffany"]
age[c("fatimat","yemi")]
 
age[1:3]
age[c(1,2,3)]

#####Creating a vector using 'seq'
weight<-seq(10,100, by=10)
weight
weight[-(4:6)]
weight[weight>70]

##Working with Matrices in R #####
weight<-seq(10,120, by=10)
dim(weight)<-c(3,4)
weight

mtr<-matrix(1:12,nrow = 3)
mtr
mtr<-matrix(1:12,ncol = 4)
mtr
mtr<-matrix(1:12,ncol = 4,byrow =T) #organize by Row
mtr

math<-c(61,53,34,45,55)
ict<-c(73,58,67,59,86)

subject<-cbind(math,ict) #Using column bind
subject

rownames(subject)<-c("2015","2016","2017","2018","2019") #Apply Row Names
subject

subject<-t(subject) #Transpose
subject

english<-c(76,56,87,95,67) # Create extra row

subject<-rbind(subject,english) #Add the created extra row
subject

#### Creating Matrix in a Single line of Code #####
weight<-matrix(c(66.5,56.0,75.0,65.4,67.9,70.9,81.2,50.0,76.3),
               nrow=3,byrow = T,
               dimnames = list(c("tiffany","funlola","fatimat"),
                               c("2019","2020","2021")))
weight


## Matrix recycles some numbers to catch up ###
example<-matrix(1:10,nrow = 4,ncol = 4)
example

##### Indexing Elements in Matrix ########
#Matrices are natural extension of vectors. 
#Matrices are multi-dimensional vectors.

unit<-c(231,323,450,500,600,700,654,321,170)
sales<-matrix(unit,nrow = 3,byrow = T)
sales

sales[1,3] #Index element at the intersection of row 1 and column 3

sales[1] # Single indexing

sales[1,] #Row indexing

sales[,3] #Column indexing


#### Slicing a Matrix in R #########
sales[c(1,3),] #Select all rows and columns on index 1 and 3
Jan.sales<-sales[c(1,3),] #Save your extraction
Jan.sales

### Attach Column and Row names to the previously created "sales"##
colnames(sales)<-c("2019","2020","2021")
rownames(sales)<-c("tiffany","funlola","yemi")
sales

sales["tiffany",] # Select the sales record for Tiffany
sales[,"2020"] #Select the Sales record in 2020 for everyone

#### Matrix Arithmetic ########

weight<-matrix(c(66.5,56.0,75.0,65.4,67.9,70.9,81.2,50.0,76.3),
               nrow=3,byrow = T,
               dimnames = list(c("tiffany","funlola","fatimat"),
                               c("2019","2020","2021")))
weight

weight_scaled<-weight/100 
weight_scaled

margin_weight<-weight-0.5
margin_weight

height<-matrix(c(1.3,6.4,4.5,1.6,2.4,3.3,4.6,1.2,3.0),nrow = 3,ncol = 3) # Create a new matrix "height"
height

#Calculate BMI for Tiffany,Funlola and Fatimat
bmi<-weight/(height)^2
bmi

colSums(weight)
rowSums(weight)

colMeans(weight)
rowMeans(weight)

#Add new Rows
Total<-colSums(weight) 
Average<-colMeans(weight)

Weight_Metrics<-rbind(weight, Total,Average)
Weight_Metrics
