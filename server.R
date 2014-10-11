library(shiny)

carbs <- function(sliderMpg){
    return(sort(unique(subset(mtcars, mpg >= sliderMpg[1] & mpg <= sliderMpg[2], carb))[,1]))
}

shinyServer(function(input, output) {
    # rendering the carburetor list as a result of the change in the mpg slider
    output$carb <- renderUI({
        selectInput("carb", "Select #carburetors", carbs(input$slider))
    })
    
    #rendering the results table after applying the two filters
    output$carTable <- renderTable({
        subset(mtcars, mpg >= input$slider[1] & mpg <= input$slider[2] & carb == input$carb)
    })    
})

