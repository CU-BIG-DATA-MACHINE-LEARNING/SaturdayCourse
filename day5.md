# Introduction to Importing Datasets


## Objectives
* Greetings/Announcements - Please make sure you have submitted all of your assignments
* Introduction to reading in data
  ```R
   #install packages
  install.packages(c("stats", "dplyr","randomForest"))

  View(iris)
  ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, fill=Species))+ geom_tile()
  ggplot(iris, aes(x=Petal.Length, y=Petal.Width, fill=Species))+ geom_tile()
  #Load libaries
  library(stats)
  library(dplyr)
  library(randomForest)

  mydata<-iris
  View(mydata)

  #splitting the data
  index = sample(2,nrow(mydata),replace=TRUE,prob=(c(0.7,0.3)))

  #training data
  Training = mydata[index==1,]
  #testing data
  Testing = mydata[index==2,]

  #rfm
  RFM = randomForest(Species~., data=Training)

  newdf <- data.frame(Sepal.Length=5.5,
                      Sepal.Width=5.5,
                      Petal.Length=5.5,
                      Petal.Width=5.5)
  predict(RFM, newdf)
  Species_Pred = predict(RFM, newdf)
  Testing$Species_Pred = Species_Pred
  View(Testing)


  #Conf matrix
  CFM = table(Testing$Species, Testing$Species_Pred)
  ```
* Project - Find a Dataset, read the dataset into R, present findings of correlation or lack there of with slides
* [Project Assignment](https://courseworks2.columbia.edu/courses/160960/assignments/862850)

## References

* [Loading Data](https://rstudio-education.github.io/hopr/r-objects.html#loading)

Homework:  https://courseworks2.columbia.edu/courses/160962/discussion_topics/884456