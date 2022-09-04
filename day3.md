# Introduction to working with data


## Objectives
* Greetings/Announcements - Please make sure you have submitted all of your assignments
* Introduction to using packages with dice function
* Work on Dice Charting Function and Visualization (plot)
    - [Packages and Help Pages](https://rstudio-education.github.io/hopr/packages.html)
```R
install.packages("ggplot2")  #installs packages
library("ggplot2")   # activates packages
# Create a function that simulates the roll of 2 di and returns the sum of both dice rolled
roll<-function(){
  dice<- 1:6
  diceroll<-sample(x=dice, size=1, replace = TRUE)
  sum(diceroll)
}

roll()

x <- c(1,5,10,12,18)
y<- c(2,7,8,19,20)
qplot(x,y)


randomdice<- c(1,1,1,2,2,3)

realdice<-replicate(10,roll())


qplot(realdice, binwidth=1)

```
* ***15 minute break***
* Introduction to built in Datasets and type of charts
  ```R
  #code for dataset and charts
  data() # shows all datasets
  View() # View a dataset in a table format
  str()  # Outputs dataset to console

  #Create a barplot on this data  
  max.temp <- c(22, 27, 26, 24, 23, 26, 28)

  barplot(max.temp,
          main = "Maximum Temperatures in a Week",
          xlab = "Degree Celsius",
          ylab = "Day",
          names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
          col = "darkred", # you can also create a list of colors 
          # col=c("red","green","blue","beige")
          horiz = TRUE)
  View(airquality)
  barplot(airquality$Temp)
  barplot(airquality$Temp)
  barplot(airquality$Temp[order(airquality$Temp)]) #orders bars in ascending order
  barplot(airquality$Temp[order(-airquality$Temp)]) #orders bars in descending order
  barplot(airquality$Temp[order(airquality$Temp)],horiz = TRUE) #displaairquality$Temps barchart in horizontal view
  barplot(airquality$Temp[order(airquality$Temp)],horiz = TRUE, col="red") #changes all bar colors to red
  barplot(airquality$Temp[order(airquality$Temp)],horiz = TRUE, col=c("red","green","blue","beige")) #makes each bar a different color
  colors() #shows list of available colors in console
  #atomic vector - a one-dimensional data object created by c() or vector()
  #if you get the '$ operator is invalid for atomic vectors' error, do this
  x<- as.data.frame(Titanic)
  barplot(x)


  #Count occurances of data in column
  table(x$Age)

  hist(Customer$Age) #gives us a histogram of frequency of age
  hist(Customer$Age,breaks = 5) #suggests the number of bars but it creates 6 bars

  hist(Customer$Age,breaks = c(0,40,60,100)) #setting strict categories, 3 bars (0-40) (40-60) (60-100)

  hist(Customer$Age,breaks = c(0,40,60,100), freq=TRUE) #sorts histogram by frequency/order

  hist(Customer$Age,breaks = c(0,40,60,100), freq=TRUE, col="blue", main="Histogram of Age") # sets chart title to "Histogram of age"

  ```
* Team activity - chose built in dataset and build a chart showing the data
* Present findings



https://www.programmingr.com/count-occurrences-in-column/