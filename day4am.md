
# Recreate Team Rooms
# Students finish up working on R based data charts  30 mins
# Students present R data charts

* Introduce Kaggle and importing datasets
 ```R
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

    ggplot(data = fire_pokemon, aes(x=Sp..Atk, y=Sp..Def)) + geom_point() #chart to see the correlation between special def and special attach of fire pokeon
    # we can infer that if a pokemon has a higher special attack then it probabl has a higher special defense
  ```
Break
Start team dataset project