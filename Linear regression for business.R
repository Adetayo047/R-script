# Introduction to R for Business Intelligence
# Linear Regression for Business

#
# Understanding Linear Regression

# The lm() function: 
#This is The principal tool used for linear regression in R

#Refer to its help page by typing 
?lm
##### loading the libraries
library(tidyverse)

### setting the working directory
setwd("C:\\Users\\user\\OneDrive\\Desktop\\DATALAB\\r class\\data")

### reading the dataset and storing it in the variable advert
adverts <- read.csv("Ch4_marketing.csv")
str(adverts)

pairs(adverts)
plot(adverts$marketing_total, adverts$revenues, ylab = "Revenues", 
     xlab = "Marketing Total", main = "Revenues and Marketing")

library(help="ggplot2")

ggplot(adverts, 
       aes(x=adverts$marketing_total, y=adverts$revenues)) + 
  geom_point() +        
  ylab("Revenues") +                  
  xlab("Marketing Total") +                                
  ggtitle("Revenues and Marketing") +        
  theme(plot.title=element_text(hjust=0.5))

####### Simple linear regression (SLR) ########

model1 <- lm(revenues ~ marketing_total, data = adverts)
model1

#provides you with two important numbers: 
#an Intercept of 32.00670, and a slope (marketing_total) 
#with a value of 0.05193.
#Interpreting your models: Models are full of numbers. 
#Without the ability to interpret them, they provide 
#little use to business leaders. In the case of your 
#first SLR, you will articulate the output using the 
#following statements:
 # y=mx+c
  #where y=revenues
        #m=slope
        #x=marketing total
        #c=intercept
    #let recall that m i.e slope = change in y/change in x

#from our output
#Revenue increases by $51.93 for every $1,000 increase 
#in total marketing
#Revenue is $32,007 when total marketing expenditure is $0
#The Intercept value is important for model execution, 
#but may not have as much interpretability. In your case, 
#this number sets the baseline level for the model.

#Revenue = 32.0067 + (0.05193 * marketing_total)

    ########### Residuals ###########

#allows the modeler to investigate the validity 
#of his or her assumption that a linear relationship exists

#The residual (or error term) is the difference between 
#the predicted value of Revenues (34.68) and 
#the actual value of Revenues (30.45), 
#when Marketing is 53.6. 
#The dotted line on the plot highlights this difference:

plot(adverts$marketing_total, adverts$revenues, 
     ylab = "Revenues", xlab = "Marketing",
     main = "Revenues versus Marketing", 
     xlim = c(50, 150), xaxt = "n")
     
abline(model1)
#residual = Predicted Value - Actual Value 
# = 34.68 - 30.45 = 4.23

segments(x0 = 53.6, y0 = 31.0, x1 = 53.6, y1 = 34.68, lwd = 2,
         lty = 3)
text(x = 57.5, y = 30.5, labels = "A")
text(x = 54.0, y = 36.3, labels = "P")
axis(1, at = c(53.6, 100, 150, 200, 250)) 

#
# Checking Model Assumptions

# Normality

par(mfrow = c(1, 2))
hist(model1$residuals, xlab = "Residuals", col = "gray",
     main = "Residuals Distribution")
qqnorm(model1$residuals, main = "Q-Q Plot of Residuals")
qqline(model1$residuals) 

######### Equal variance######
#The code once again uses the $ operator to extract 
#the residuals. It is also extracts the fitted values 
#from model1. The abline() function was used to create 
#reference lines of a mean around zero and for a visual 
#indictor of equal variance:

par(mfrow = c(1, 1))
plot(model1$fitted.values, model1$residuals, ylab = "Residuals",
     xlab = "Fitted Values", main = "Residuals Distribution")
abline(0, 0, lwd = 3); abline(h = c(-6.5, 6.5), lwd = 3, lty = 3)


# ########## Using a Simple Linear Regression#########
######### Interpreting model output ######
#There is a lot of information available within a 
#linear regression model. You can see an expanded 
#output by using the summary() function:

summary(model1)

# Predicting unknown outputs with an SLR

range(adverts$marketing_total)


suppressMessages(suppressWarnings(library(dplyr)))
select(adverts, marketing_total) %>% 
  filter(marketing_total > 430)

newdata <- data.frame(marketing_total = 460)
predict.lm(model1, newdata, interval = "predict")

predict.lm(model1, newdata, level = 0.99, interval = "predict")
predict.lm(model1, newdata, level = 0.90, interval = "predict")

newdata = data.frame(marketing_total = c(450, 460, 470))
predict.lm(model1, newdata, interval = "predict")

