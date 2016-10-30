#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI
(
  fluidPage (title="My First Shiny Application",
      navbarPage(title="My Shiny Application",
        tabPanel ("How it works",

          h3("Documentation"),
          hr(""),
          print("This application uses the Random Numbers, based upon the selcted value from the slider. I have tried two different way, Reactive update and Event based update"),
          br(),
          br(),    
          print("Reactive : It give the application a 'live' quality. Any changes in the value of different attributes will be reflected automatically."),
          br(),
          br(),
          print("Event Based : User can changes the value of different attributes, but changes will be reflected only when the user hits 'Update' button."),
          hr("")          
          
          
        ),
        tabPanel
        ("Reactive",

            # Application title
            titlePanel("Select Interactive Data"),

            # Sidebar with a slider input for number of bins
            sidebarLayout
            (
              sidebarPanel
              ( width = 3,
                wellPanel
                  (
                    h3("Description"),
                    hr(""),
                    print("This application uses the Random Numbers, based upon the selcted value from the slider."),
                    print("You can select slider value and/or Enter the variables form the panle below system will automatically update the view with updated results in the right panel."),                  
                    hr(""),  
                    sliderInput("interActiveNumber", "Number:", min = 1,max = 250,width = "75%",value = 30),
                    textInput("interActiveTitle", "Enter a Title", width = "75%", value ="", placeholder = "Enter Histograms Title"),
                    textInput("interActiveXLab", "X Axis Label", width = "75%", value = "", placeholder = "Enter X-axis Label"),
                    textInput("interActiveYLab", "Y Axis Label", width = "75%", value = "", placeholder = "Enter Y-axis Label"),
                    radioButtons
                        ("interactiveCheckGroup",
                             label = h3("Histogram Color"),
                             choices = list("Red" = "red","Blue" = "blue","Black" = "black"),
                             selected = "red"
                        )
                  )
              ),
              # Show a plot of the generated distribution
              mainPanel
              (
                  h1("Reactive Histogram"),
                  hr(""),
                  plotOutput("interActiveTitlePlot"),
                  hr(""),
                  h1("Data Summary"),
                  verbatimTextOutput("interActiveTitleStats")
              )
           )
        ),
        tabPanel
                ("Event Based",
                
                # Application title
                titlePanel("Select Data"),

                 # Sidebar with a slider input for number of bins
                 sidebarLayout
                 (
                   sidebarPanel
                   (
                     wellPanel
                     (
                     
                        h3("Description"),
                        hr(""),
                        print("This application uses the Random Numbers, based upon the selcted value from the slider."),
                        print("You can select slider value and/or Enter the variables form the panle below and Click the Update button to view the updated results in the right panel."),                  
                        hr(""),                       
                     
                       sliderInput("reActiveNumber", "Number:", width = "75%", min = 1,max = 250,value = 30),
                       textInput("reActiveTitle", "Enter a Title", width = "75%",value = "", placeholder = "Histogram Title Goes Here"),
                       textInput("reActiveXLab", "X Axis Label", width = "75%", value = "", placeholder = "Enter X-axis Lable"),
                       textInput("reActiveYLab", "Y Axis Label", width = "75%", value = "", placeholder = "Enter Y-axis Lable"),                     
                       actionButton("update", "Update")
                     )
                   ),

                   # Show a plot of the generated distribution
                   mainPanel
                   (
                     plotOutput("distPlot"),
                     verbatimTextOutput("stats")
                   )
                )
          )
      )
  )
)
