# DATA VISUALIZATION

# Lets install the packages
installed.packages("datasets")

# Lets plot
plot(ChickWeight)

# Base Graphics
library(MASS)
plot(UScereal$sugars,UScereal$calories)
title("plot(UScereal$sugars,UScereal$calories)")

x<-UScereal$sugars
y<-UScereal$calories
library(grid)

# Grid Graphics
pushViewport(plotViewport())
pushViewport(dataViewport(x,y))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.points(x,y)
grid.text("UScereal$calories",x=unit(-3,"lines"),rot=90)
grid.text("UScereal$Sugars",y=unit(-3,"lines"),rot=0)
popViewport(2)

# Pie Chart
x<-c(33,45,70,110)
labels<-c("Soap","Detergent","Oil","Shampoo")
pie(x,labels)
pie(x,labels,main="City Pie Chart",col=rainbow(length(x)))
piepercent<-round((100*x)/sum(x),1)
pie(x,labels=piepercent,main="City Pie Chart",col=rainbow(length(x)))
legend("topright",c("Soap","Shampoo","Oil","Grocery"),cex=0.8,fill=rainbow(length(x)))

# 3D Piechart
install.packages("plotrix")
library(plotrix)

x<-c(33,45,70,110)
lbl<-c("Soap","Detergent","Oil","Shampoo")
pie3D(x,labels=lbl,explode=0.1,main="Pie Chart of Products")

# Histograms
v<-c(9,13,21,8,36,22,12,41,31,33,19)
hist(v,xlab = "Weight",col = "green",border = "red")
hist(v,xlab = "Weight",col = "green",border = "red",xlim = c(0,40),ylim = c(0,5),breaks = 5)

# Lets use the air quality data
data("airquality")
View(airquality)

# Scatterplots
plot(airquality$Ozone,airquality$Wind)
plot(airquality$Ozone,airquality$Wind,col="red")

# Histogram
plot(airquality$Ozone,airquality$Wind,type = "h",col="blue")

#Lets see an overall plots of the features
plot(airquality)

# Assigning labels to the plot
plot(airquality$Ozone,xlab = "Ozone Concentration",ylab = "Number of Instances",main = "Ozone Levels in NY City",col="green")

# Histograms
hist(airquality$Solar.R)
hist(airquality$Solar.R,main = "Solar Radiation Values in Air",xlab = "Solar Radiations",col = "red")
temp<-airquality$Temp
hist(temp)
# Histogram with labels
h <- hist(temp,ylim=c(0,40))
text(h$mids,h$counts,labels=h$counts, adj=c(0.5, -0.5))
# Histogram with non-uniform width
hist(temp,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="chocolate",
     border="brown",
     breaks=c(55,60,70,75,80,100)
)

# Boxplot

boxplot(airquality$Solar.R)
# Multiple box plots
boxplot(airquality[,0:4], main='Multiple Box plots')

# Using ggplot2 library to analyse mtcars dataset
install.packages("ggplot2")
library(ggplot2)
attach(mtcars)

p1<-ggplot(mtcars,aes(factor(cyl),mpg))
p1+geom_boxplot()
p1+geom_boxplot()+coord_flip()
p1+geom_boxplot(aes(fill=factor(cyl)))

# Create factors with value labels
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),  
                      labels=c("3gears", "4gears", "5gears"))  
mtcars$am <- factor(mtcars$am,levels=c(0,1),  
                    labels=c("Automatic","Manual"))  
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),  
                     labels=c("4cyl","6cyl","8cyl"))
# Scatter Plots
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point()

# Scatter plos by factors
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = as.factor(cyl))) + geom_point()

# Scatter plots by size
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, size = qsec)) + geom_point()
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = as.factor(cyl), size = qsec)) + geom_point()

# Different symbols for different sizes
p  <-  ggplot(mtcars,aes(mpg, wt, shape  =  factor(cyl)))
p + geom_point(aes(colour  =  factor(cyl)), size  =  4) + geom_point(colour  =  "grey90", size  =  1.5)

#---Visualization using mpg dataset------------

ggplot2::mpg
View(ggplot2::mpg)

#Bar plot
ggplot(data = ggplot2::mpg, aes(class)) + geom_bar()

# Stacked bar chart
ggplot(data = ggplot2::mpg, aes(class)) + geom_bar(aes(fill = drv))

# Using dodge
ggplot(data = ggplot2::mpg, aes(class)) + geom_bar(aes(fill = drv), position = "dodge")

# Scatterplot
ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Using plotly library
install.packages("plotly")
library(plotly)
p <- plot_ly(data = mtcars, x = ~hp, y = ~wt, marker = list(size = 10, color = 'rgba(255, 182, 193, .9)', line = list(color = 'rgba(152, 0, 0, .8)', width = 2)))
p

p <- plot_ly(data = mtcars, x =~hp, y = ~wt,color = ~hp, size = ~hp )
p
