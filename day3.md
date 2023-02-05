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
  install.packages("dplyr")
    pokemon <- read.csv('C:/Users/terra/projects/ColumbiaUniversity/lessons-main/resources/pokemon.csv')

    View(pokemon) #view Pokemon as table

    #checking number of rows and columns
    nrow(pokemon)
    ncol(pokemon)

    #categorical columns
    table(pokemon$Legendary)# Tells me how many pokemon are and are not legendary
    table(pokemon$Type.1) #Counts the occurance of different types in the pokemon table
    table(pokemon$Generation) # Counts the number of pokemon in each generation

    # min and max values in table
    min(pokemon$HP)
    max(pokemon$HP)
    max(pokemon$Name)

    #checking for missing values
    is.na(pokemon$Type.2)
    sum(is.na(pokemon$Type.2))


    #rename columns
    colnames(pokemon) #gets all column names in table
    colnames(pokemon)[colnames(pokemon) == 'Type.1']<- "primary_type" #changes Type.1 to column type, we can now see this in the view

    #get all fire type pokemon
    pokemon %>% filter(pokemon$Type.2 == "Fire")-> fire_pokemon
    View(fire_pokemon)

    # find the minimal speed of firetype pokemon
    min(fire_pokemon$Speed)


    #find average attack of fire pokemon
    mean(fire_pokemon$Attack)

    # ploting pokemon data ( make sure ggplot is enabled)
    ggplot(data = fire_pokemon, aes(x=HP))+geom_histogram()  #counts the number of fire pokemon by hp
    #aes stands for aesthetic where we set the x-axis to be hp
    ggplot(data = fire_pokemon, aes(x=HP))+geom_histogram(fill="red")
    #changes the chart to red

    ggplot(data = fire_pokemon, aes(x=Attack))+geom_histogram(fill="red")

    #bar chart to show how many fire type pokemon are legendary
    ggplot(data=fire_pokemon,aes(x=Legendary))+geom_bar(fill="pink")

    pokemon %>% filter(primary_type=="Water") -> water_pokemon
    mean(water)

    ggplot(data=fire_pokemon,aes(x=Generation,fill=as.factor(Generation))) +geom_bar() #multi color bars representing the generations of fire pokemon

    ggplot(data=fire_pokemon, aes(x=primary_type, fill=as.factor(primary_type)))+ geom_bar() #primary types of those with a second type of fire

    ggplot(data = fire_pokemon, aes(x=Sp..Atk, y=Sp..Def)) + geom_point() #chart to see the correlation between special def and special attach of fire pokemon
    # we can infer that if a pokemon has a higher special attack then it probabl has a higher special defense

  ```
* Team activity - chose built in dataset and build a chart showing the data
* Present findings



https://www.programmingr.com/count-occurrences-in-column/
