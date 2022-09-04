# Continue with data plotting projects
Get Everyone into teams - recall who was teamed with whom
Work on datasets
Present datasets
Histograms and heatmaps
```R
Customer <- read.csv("C:/Users/terra/projects/ColumbiaUniversity/CourseLessonPlans/Customer.csv")

hist(table(Customer$Age))

hist(Customer$Age) #gives us a histogram of frequency of age
hist(Customer$Age,breaks = 5) #suggests the number of bars but it creates 6 bars

hist(Customer$Age,breaks = c(0,40,60,100)) #setting strict categories, 3 bars (0-40) (40-60) (60-100)

hist(Customer$Age,breaks = c(0,40,60,100), freq=TRUE) #sorts histogram by frequency/order

hist(Customer$Age,breaks = c(0,40,60,100), freq=TRUE, col="blue", main="Histogram of Age") # sets chart title to "Histogram of age"


ggplot(Customer, aes(x=Age, y=State, fill=Segment))+ geom_tile()
ggplot(Customer, aes(x=Region, fill=as.factor(Segment))) + geom_bar()

#subset with dataframe
newDF<- data.frame(Customer$Customer.Name,Customer$Age,Customer$State, stringsAsFactors=T)
table(newDF$Customer.Age)
hist(newDF$Customer.Age)


#subset with Filter
Customer %>% filter(Region=="South") -> Southerners
ggplot(Southerners, aes(x=Segment, y=State, fill=Age))+ geom_tile()

regions<- table(Customer$Region)

table(Customer$Age, Customer$Region)
```

Challenge - Create a plot with a ggplot that you haven't used before:
https://r-graph-gallery.com/index.html


