# Installing deplyr package
install.packages("dplyr")

# Lets explore
library(dplyr)

# Lets install a sample dataset
install.packages('nycflights13')
library("nycflights13")

# Lets view the dataset
View(flights)

# Lets see the first six rows
head(flights)

# Subset data set using filters
f1<-filter(flights,month==07)
View(f1)

# Lets use another filter
f2 <- filter(flights,month==07,day==3)
f2
View(f2)

# Lets use a filter within the view function
View(filter(flights,month==09,day==2,origin=='LGA'))

# We can also perform the above line of code using head
head(flights[flights$month==09 & flights$day==2 & flights$origin=='LGA', ])

# Lets use slice() to select rows by position
slice(flights,1:5)
slice(flights,5:10)

# mutate() is used to add new columns
over_delay<-mutate(flights,overall_delay=arr_delay-dep_delay)
View(over_delay)
head(over_delay)

# transmute() function is used to show only new columns
over_delay<-transmute(flights,overall_delay=arr_delay-dep_delay)
View(over_delay)

# Lets use summarise() to get the descriptive statistics
summarise(flights,avg_air_time=mean(air_time,na.rm=T))
summarise(flights,tot_air_time=sum(air_time,na.rm=T))
summarise(flights,stdev_air_time=sd(air_time,na.rm=T))
summarise(flights,avg_air_time=mean(air_time,na.rm=T),tot_air_time=sum(air_time,na.rm=T),stdev_air_time=sd(air_time,na.rm=T)) # Compiling the above three

# group_by()
# Example 1:
by_gear<-mtcars %>% group_by(gear)
by_gear
View(by_gear)

a<-summarise(by_gear,gear=sum(gear),gear2=mean(gear))
a

summarise(group_by(mtcars,cyl),mean(gear,na.rm=T))


b<-by_gear %>% summarise(gear1=sum(gear),gear2=mean(gear))
b

# Example 2:

by_cyl <- mtcars %>% group_by(cyl)
by_cyl %>% summarise(
  gear = mean(gear),
  hp = mean(hp)
)

# sample_n() and sample_frac for creating samples------------

sample_n(flights,15) # gives 15 random samples

sample_frac(flights,0.4) #returns 40% of the total data    

# arrange() used to sort dataset

View(arrange(flights,year,dep_time))

head(arrange(flights,desc(dep_time)))


# usage of pipe operator %>%

df<- mtcars
df
View(mtcars)

#Nesting

result<-arrange(sample_n(filter(df,mpg>20),size = 5), desc(mpg))

View(result)

# multiple assignment

a<- filter(df,mpg>20)
b<- sample_n(a,size = 5)
result<- arrange(b,desc(mpg))
result

# same using pipe operator

# syntax- data %>% op1 %>% op2 %>% op3

result<- df %>% filter(mpg>20) %>% sample_n(size=10) %>% arrange(desc(mpg))
result

