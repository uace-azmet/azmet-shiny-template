# <App description>

# Add code for the following
# 
# 'azmet-shiny-template.html': <!-- Google tag (gtag.js) -->
# 'azmet-shiny-template.html': <!-- CSS specific to this AZMet Shiny app -->

# Edit the following [in square brackets]:
# 
# 'azmet-shiny-template.html': <title>[Web Application Title] | Arizona Meteorological Network</title>
# 'azmet-shiny-template.html': <h1 class="hidden title"><span class="field field--name-title field--type-string field--label-hidden">[Hidden Title]</span></h1>
# 'azmet-shiny-template.html': <span class="lm-az"></span>
# 'azmet-shiny-template.html': <h1 class="mt-4 d-inline">[Web Tool Name]</h1>
# 'azmet-shiny-template.html': <h4 class="mb-0 mt-2">[High-level text summary]</h4>


# UI --------------------


ui <- htmltools::htmlTemplate(
  
  filename = "azmet-shiny-template.html",
  
  sidebarLayout = shiny::sidebarLayout(
    position = "left",
    
    shiny::sidebarPanel(
      id = "sidebarPanel",
      width = 4,
      
      shiny::verticalLayout(
        shiny::selectInput("dataset", label = "Dataset", choices = ls("package:datasets"))
      )
    ), # sidebarPanel()
    
    shiny::mainPanel(
      id = "mainPanel",
      width = 8,
      
      shiny::verbatimTextOutput("summary"),
      shiny::tableOutput("table")
    ) # mainPanel()
  ) # sidebarLayout()
) # htmltools::htmlTemplate()


# Server --------------------


server <- function(input, output, session) {
  
  # Observables -----
  
  # Reactives -----
  
  # Outputs -----
  
  output$summary <- shiny::renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- shiny::renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}


# Run --------------------


shiny::shinyApp(ui = ui, server = server)
