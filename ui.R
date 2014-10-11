library(shiny)

shinyUI(pageWithSidebar(
    
    titlePanel("Filter on mtcars"),
    
    sidebarPanel(

        helpText("The purpose of this application is to display in the main panel's table the subset of the mtcars dataset which verifies the filters specified in the sidebar controls"),
        
        br(),

        sliderInput("slider", "mpg", min = 10, max = 34, value = c(20, 25)),

        br(),

        helpText("Select range of miles per gallon",
                 "the carburetor selection list",
                 "will update consequently."),
        
        br(),

        uiOutput("carb")
    ),
    
    
    mainPanel(
        helpText("The content of the cars table",
                 "will be updated applying",
                 "the selected filters."),

        tableOutput("carTable")
    )
)
)
