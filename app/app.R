

# <App description>

# INITIAL EDITS NEEDED [in square brackets]:
# 
# 'azmet-shiny-template.html': <title>[Web Application Title] | Arizona Meteorological Network</title>
# 'pre-app-html.html': <h1 class="hidden title"><span class="field field--name-title field--type-string field--label-hidden">[Hidden Title]</span></h1>
# 'pre-app-html.html': <article role="article" about="[/application-areas]" class="node node--type-az-flexible-page node--view-mode-full clearfix">
# 'pre-app-html.html': <span class="lm-az"></span>
# 'pre-app-html.html': <h1 class="mt-4 d-inline">[Web Tool Name]</h1>
# 'pre-app-html.html': <h4 class="mb-0 mt-2">[High-level text summary]</h4>


# Libraries
library(azmetr)
library(dplyr)
library(htmltools)
library(lubridate)
library(shiny)
library(vroom)

# Functions
#source("./R/fxnABC.R", local = TRUE)

# Scripts
#source("./R/scr##DEF.R", local = TRUE)


# UI
ui <- htmltools::htmlTemplate(
  "azmet-shiny-template.html",
  
  sidebarLayout = sidebarLayout(
    position = "left",
    
    sidebarPanel(
      id = "sidebarPanel",
      width = 4,
      
      verticalLayout(
        selectInput("dataset", label = "Dataset", choices = ls("package:datasets"))
      )
    ),
    
    mainPanel(
      id = "mainPanel",
      width = 8,
      
      verbatimTextOutput("summary"),
      tableOutput("table")
    )
  )
)


# Server
server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}

# Run 
shinyApp(ui = ui, server = server)