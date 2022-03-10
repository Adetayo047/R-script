### here is a checklist of best practices you should always consider when cleaning raw data:

#0.Familiarize yourself with the data set
#1.Check for structural errors
#2.Check for data irregularities
#3.Decide how to deal with missing values
#4.Document data versions and changes made

#######  importing libraries #######
library(tidyverse)

df <- read_csv("//Users//datalab//Desktop//DATALAB/DATALAB//R//team_dew R//data for health//mental-heath-in-tech-2016_20161114.csv")

####.Familiarize yourself with the data set

View(df)

### check how many number of rows and columns
dim(df)

str(df)

colnames(df)
#a) Mislabeled variables:
######  Renaming column  ######
df <- df %>% rename(employees = "How many employees does your company or organization have?")
df <- df %>% rename(employment_status = "Are you self-employed?")
df <- df %>% rename(organization_tech = "Is your employer primarily a tech company/organization?")
df <- df %>% rename(employees_role = "Is your primary role within your company related to tech/IT?")
df <- df %>% rename(healthcare_coverage = "Do you know the options for mental health care available under your employer-provided coverage?")
df <- df %>% rename(employees_mentalcare_prov = "Does your employer provide mental health benefits as part of healthcare coverage?")
df <- df %>% rename(mental_discus = "Has your employer ever formally discussed mental health (for example, as part of a wellness campaign or other official communication)?")
df <- df %>% rename(Age = "What is your age?")
df <- df %>% rename(Gender = "What is your gender?")
df <- df %>% rename(Country = "What country do you live in?")
df <- df %>% rename(City = "What US state or territory do you live in?")
df <- df %>% rename(work_description = "Which of the following best describes your work position?")
df <- df %>% rename(work_remote = "Do you work remotely?")

####### do for others

typeof(df$employees)
View(df)
