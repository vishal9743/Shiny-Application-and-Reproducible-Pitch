library(shiny)
library(shinythemes)

# Define UI for application that draws an output
  shinyUI(fluidPage(theme = shinytheme("slate"),
                  
                  # Application title
                  titlePanel("Predict Horsepower from MPG"),
                  
                  # Sidebar with options selectors
                  sidebarLayout(
                      sidebarPanel(
                          sliderInput("sliderMPG","Select MPG of the car",min = 10,
                                      max=35,value = 20),
                          checkboxInput("showModel","Show/Hide Model ",value = TRUE),
                          
                          submitButton("SUBMIT")
                      ),
                      
                      # Show a plot with points and regression line
                      mainPanel(
                          plotOutput("plot"),
                          h3("Predicted Horsepower:"),
                         h3(span(textOutput("pred"),style="color:hotpink"))
                      )
                  )
))