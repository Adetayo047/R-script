#### to install the database package
install.packages("RMySQL")
#install.packages("RMySQL")
library(RMySQL)

#### to establish connections
mydb = dbConnect(MySQL(), 
                 user='root', 
                 password='datalab0282', 
                 dbname='classicmodels', 
                 host='localhost')

#### to list out the tables in the database selected
dbListTables(mydb)

#### to list out the fields in the table selected
dbListFields(mydb, 'customers')



rs <- dbSendQuery(mydb,	"select	*	FROM	customers WHERE customerNumber >100")

rs <- dbSendQuery(MYDB,	"select	*	from	customers limit	10;")

while (!dbHasCompleted(res)) { 
  chunk <- dbFetch(res, 10000) 
  process(chunk) 
} 

