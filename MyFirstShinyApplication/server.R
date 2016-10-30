#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  set.seed(7575)

## Code for Interactive TAB
  data <- reactive( {rnorm(input$interActiveNumber)} )
  output$interActiveTitlePlot <- renderPlot({hist(data(),col = input$interactiveCheckGroup, border = 'white', xlab = input$interActiveXLab, ylab = input$interActiveYLab, main = input$interActiveTitle )})
  output$interActiveTitleStats <- renderPrint( {summary(data())})
  #outputs data on the server
  observeEvent(input$update, {print(as.numeric(input$update))})

## Code for ReAactive TAB
  rectiveEventData <- eventReactive(input$update, {rnorm(input$reActiveNumber)} )
  output$distPlot <- renderPlot({hist(rectiveEventData(),col = 'darkgray', xlab= isolate(input$reActiveXLab), ylab = isolate(input$reActiveYLab) ,border = 'white', main = isolate(input$reActiveTitle ))})
  output$stats <- renderPrint( {summary(rectiveEventData())})

})
