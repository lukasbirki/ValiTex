library(shiny)
library(shinyjs)
library(shinythemes)

ui <- fluidPage(
  useShinyjs(),
  h2("Heading 1", id = "heading1", style = "cursor:pointer;"),
  div(id = "content1", style = "display:none;", 
      p("This is the content for Heading 1.")),
  
  h2("Heading 2"),
  p("This is the content for Heading 2.")
)

server <- function(input, output, session) {
  shinyjs::runjs("$('#heading1').click(function() { $('#content1').toggle(); })")
  
  }

shinyApp(ui, server)

