library(shiny)

# Define server logic required to draw a plot
shinyServer(function(input,output){
    
    # Perform some Exploratory data analysis.
    mtcars$cars <- row.names(mtcars)
    row.names(mtcars) <- NULL
    
    # Build linear regression model 
    model <- lm(hp~mpg,data = mtcars)
    
    # Predicting the horsepower
    modelpred <- reactive({
        
        # Relabeling the input
        mpgInput <- input$sliderMPG
        
        predict(model,newdata=data.frame(mpg=mpgInput))
    })
    
    output$plot <- renderPlot({
        mpgInput <- input$sliderMPG
        
        #Draw the plot using plot() function.
        plot(mtcars$mpg,mtcars$hp,xlab = "Miles Per Gallon",cex.lab=1.4,cex.main=2,
             ylab = "HorsePower",main="Model Prediction",bty = "n",pch=16,col=mtcars$cyl,
             xlim = c(10,40),ylim = c(0,450))
        if(input$showModel){
            abline(model,col="blue",lwd=2)
        }
        
        # Show the required legends in the plot
        points(mpgInput, modelpred(), col="red",pch=16,cex=2)
        
        legend(31,400, c("4 cylinder","6 cylinder","8 cylinder"),pch=16,
               col = c("grey","hotpink","blue"),cex = 1.7)
        
    })
    
    output$pred <- renderText({
        modelpred()
    })
})
