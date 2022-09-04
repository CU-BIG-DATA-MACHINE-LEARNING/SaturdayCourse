install.packages(c("stats","dplyr","randomForest"))
library(shiny)
library(shinythemes)
library(stats)
library(dplyr)
library(randomForest)

min(iris$Sepal.Width)

ui<- fluidPage(theme= shinytheme("united"),
    headerPanel('Match the Iris'),
    sidebarPanel(
      h2("Input Params"),
      sliderInput("petalWidth", "Petal Width:", min=min(iris$Petal.Width), max=max(iris$Petal.Width),value=1),
      sliderInput("petalLength", "Petal Length:", min=min(iris$Petal.Length), max=max(iris$Petal.Length),value=1),
      sliderInput("sepalWidth", "Sepal Width:", min=min(iris$Sepal.Width), max=max(iris$Sepal.Width),value=2.5),
      sliderInput("sepalLength", "Sepal Length:", min=min(iris$Sepal.Length), max=max(iris$Sepal.Length),value=5),
      actionButton("submitBtn", "Make Prediction", class="btn btn-primary")
    ), 
    mainPanel(
      tags$label(h3('Iris Prediction')),
      verbatimTextOutput('contents'),
      tableOutput('tabledata')
    )
               
)
server<-function(input, output, session){
  index = sample(2, nrow(iris), replace=T, prob=(c(0.7,0.3)))
  Training = iris[index==1,]
  Testing = iris[index==2,]
  
  RFM = randomForest(Species~., data=Training)
  
  output$contents <- renderPrint({
    if(input$submitBtn>0){
      
      inputData <- data.frame(Sepal.Length = input$sepalLength, 
                              Sepal.Width = input$sepalWidth, 
                              Petal.Length = input$petalLength, 
                              Petal.Width=input$petalWidth)
      
      predict(RFM, inputData)
    }
  })
}
shinyApp(ui=ui, server=server)

