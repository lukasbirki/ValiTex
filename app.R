library(readxl)
library(writexl)
library(tidyverse)
library(DT)
library(shinythemes)
library(shinyjs)
library(RefManageR)
library(shinydashboard)


df <- readxl::read_excel("data/Framework.xlsx")

ui <- fluidPage(theme = "flatly",
                useShinyjs(),
                includeCSS("styles.css"),
                
                
                windowTitle = "ValiTex",  # Text displayed in the browser window title
                navbarPage(title = "ValiTex",
                           theme = "navbar-default",
                #Background ----
                tabPanel("Home",
                         h2("ValiTex- A Validation Framework for Computational Text-based Measures of Social Science Constructs", align = "center"),
                         h4("Beta Version 0.9", align = "center"),
                h3("About"),
                         p("This webpage accompanies the ", tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank", 
                        "ValiTex"),"framework by", tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank", 
                                                          "Birkenmaier et al. (2023)."),
                  "The framework is designed to help reserachers that aim to measure social science constructs using computational text analysis to validate thier measures."),
                h3("Overview"),
                p("Computational methods to analyse textual data require careful validation (Grimmer and Stewart, 2013; Grimmer et al., 2022). However, social science researchers
                  often lack common terminology and a unified framework that provides guidance to do so. We present a novel validation framework for text analysis (ValiTex) that guides scholars who aim to measure social science constructs based on textual data. Conceptuall, the framework concists of two components:"),
                tags$ol(type = "1",
                  tags$li(tags$b("Conceptual Model:"),"provides a general structure along distinct phases on how to approach validation for text-based measures of social science constructs (see Figure 1, click to expand)"),
                  tags$li(tags$b("Dynamic Checklist:"),"defines and specifies specific validation steps and provides guidance on which steps are considered recommendable or optional"),),
                p("For a detailed introduction into the theoretical background of the framework, please refer to the paper [Link to preprint]"),
                div(
                  tags$img(src = "framework.png", id = "myimage", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),
                  p(class = "caption", "Figure 1: Conceptual Model (click to expand)")),),
                #Checklist----
                tabPanel("Checklist",
                         h2("Generate your Checklist", align = "center"),
                         h3("User Instructions"),
                         p(HTML(paste("This application generates an adaptable checklist that you can use to validate your text-based measures. 
                Each row within the table corresponds to one validation step (i.e., a single reported and clearly demarcated validation activity). Validation steps can be either ", 
                                      span(style="color:#ed969e; font-weight: bold", "recommended "), "or ", 
                                      span(style="color:#96caed; font-weight: bold", "optional "),"depending on their relevance.", sep = ""),"As outlined in the corresponding paper, researchers should initially follow the order of the phases, starting with the substantive validation steps and ending with external validation steps while continuously considering robustness checks. 
                However, researchers might adapt this process to their individual use case."),
                           p("ValiTex accounts for differences in validation pracices across text-based methods and research contexts. At present, ValiTex differentiates between four broad types of text-based methods:"),
                           tags$ul(tags$li(tags$b("Dictionary:"),"Rule-based methods that include words or phrases along with their respective meanings or sentiments (e.g., SentiWS)"),
                                   tags$li(tags$b("Supervised:"),"Machine-learning methods that include some form of training data and test set and/or classification task (e.g., SVM, BERT)"),
                                   tags$li(tags$b("Unsupervised (Topic Model):"),"Unsupervised methods that generate topis based on word-coocurrences (e.g., LDA) "),
                                   tags$li(tags$b("Unsupervised (Text Scaling)"),"Unsupervised methods that produce scores that relate to some underlying scale based on word-coocurrences (e.g., Wordfish, Wordscores)"),
                           ),
                           tags$p(tags$b("Please start by choosing a method from the drop-down menue below."), "The complete list of validation steps is also available on ",
                                  tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist/tree/main/data",target="_blank", 
                                         "Github.")),
                           
                           
                           # Sidebar layout with input and output definitions 
                           verticalLayout(
                             
                             # Sidebar panel for inputs
                             sidebarPanel(width = 12,
                                          
                                          # Input: Choose dataset 
                                          selectInput("Method", "What text-based method do you want to validate? Please choose below:",
                                                      choices = c("--Please select a method--","Dictionary","Supervised", "Unsupervised: Topic Model", "Unsupervised: Text Scaling"),
                                                      selected = ""),
                                          
                                          
                                          
                             ),
                             
                             # Main panel for displaying outputs 
                             mainPanel(width = 12, 
                                       tags$script('
  $(document).on("click", "#myimage", function() {
    if ($(this).hasClass("expanded")) {
      $(this).removeClass("expanded");
      $(this).css("max-width", "30%");
    } else {
      $(this).addClass("expanded");
      $(this).css("max-width", "90%");
    }
  });
'),conditionalPanel(
  tags$style(HTML('.group {background-color: #ccc !important;}')),
  condition = "input.Method != '--Please select a method--'",  # Only show table when Method input is not empty
  # downloadButton("downloadData", "Download (Excel)",
  #                style = "float: right; margin-left: 10px;"),
  downloadButton("Download_word", "Download (Word)",
                 style = "float: right; margin-left: 10px;"),
  tags$h3(HTML(paste("Your selected text method is:",tags$b(tags$span(textOutput("value")), style = "display:inline-block;")), sep = "")),
  
  DT::dataTableOutput("table"),  # Change from tableOutput to dataTableOutput
  
),
#Button
# Add image below description
                             )
                           )
                         ),

                         
                         ),
                #Citation ----
                tabPanel("Feedback",
                         h3("Feedback"),
                         p("Please note this application is currently under construction and evolution.
                         Please feel free to reach out to us with any feedback you have. We are eager to hear from you and will take your suggestions into consideration as we continue to develop and enhance our website. To reach us, please refer to lukas.birkenmaier@gesis.org.
 "),
                         h3("Citation"),
                         p("When refering to the site or the corresponding workin paper in publications, please cite the following references:"),
                         p("Birkenmaier, Lukas; Lechner, Clemens; Wagner, Claudia. (2023).",tags$em("ValiTex - a uniform validation framework for computational text-based measures of social science constructs."), "[Link to Arxiv DOI, tba. soon]"),
                         verbatimTextOutput("citationOutput"),
                         
                         ),    
                )
)

server <- function(input, output) {
  shinyjs::runjs("$('#heading1').click(function() { $('#content1').toggle(); })")
  output$table <- renderDT({
    df |>
      dplyr::select(Phase, `Validation Step`, input$Method,Considerations,"Performance Criteria") |>
      dplyr::filter(!!sym(input$Method) != "n.a.") |>
      dplyr::rename(Status = input$Method) |>
      dplyr::mutate(Phase = factor(Phase, levels = c("Substantive Phase", "Structural Phase", "External Phase", "Continuous Evaluation: Robustness Checks"))) |> 
      mutate(" " = '<input type="checkbox" name="select_row">', .before = 1) -> df_output
    
    df_output |> 
      datatable(
        rownames = FALSE,
        escape = FALSE,
        class = 'cell-border stripe',
        options = list(
          ordering = FALSE,
          dom = 'rit',
          columnDefs = list(list(visible = FALSE, targets = 1)),
          order = list(list(1, 'asc')),
          displayLength = nrow(df),
          drawCallback = JS(
            "function(settings) {
          var api = this.api();
          var rows = api.rows({page:'current'}).nodes();
          var last = null;
          var currentPhase = null;

          api.column(1, {page:'current'}).data().each(function(group, i) {
            if (last !== group) {
              currentPhase = group;
              $(rows).eq(i).before(
                '<tr class=\"group\"><td colspan=\"' + api.columns().count() + '\">' + group + '</td></tr>'
              );
              last = group;
            }
          })
        }")
        )
      ) |> 
      formatStyle(
        "Status",
        valueColumns = "Status",
        backgroundColor = styleEqual(c("Recommended", "Optional"), c("#f8d7da", "#d7ebf8")),
        justifyContent = "center",
        backgroundOpacity = 0
        
      )
  })
  selected_option <- reactive({
    input$Method
  })
  output$value <- renderText({
    paste(selected_option())
  })
  
  
  # Downloadable word of selected dataset 
  output$Download_word <- downloadHandler(
    filename = function() {
      paste("checklist_validity_",tolower(as.character(input$Method)), ".docx", sep = "")
    },
    content = function(file) {
      if (input$Method == "Dictionary") {
        file.copy("data/checklists/checklist_dictionary.docx", file)
      }
      if (input$Method == "Supervised") {
        file.copy("data/checklists/checklist_supervised.docx", file)
      }
      if (input$Method == "Unsupervised: Topic Model") {
        file.copy("data/checklists/checklist_unsupervised_TM.docx", file)
      }
      if (input$Method == "Unsupervised: Text Scaling") {
        file.copy("data/checklists/checklist_unsupervised_TS.docx", file)
      }
    }
  )
  output$citationOutput <- renderPrint({
    bib_entry <- "@unpublished{birkenmaier2023Valitex,
      title={ValiTex - a uniform validation framework for computational text-based measures of social science constructs},
      author={Birkenmaier, Lukas and Lechner, Clemens and Wagner, Claudia},
      archivePrefix = {arXiv},
      year={2023},
    }"
    
    cat(bib_entry)
  })
}


# Run the app
shinyApp(ui = ui, server = server)