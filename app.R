library(readxl)
library(writexl)
library(tidyverse)
library(DT)
library(shinythemes)
library(shinyjs)

df <- readxl::read_excel("data/Framework.xlsx")

ui <- fluidPage(theme = "flatly",
                useShinyjs(),
                
                tags$style(
                  HTML("
      #myimage {
        max-width: 30%;
        height: auto;
          display: block;
  margin-left: auto;
  margin-right: auto;
      }
      .caption {
        text-align: center; font-style: italic; font-size: 18px;}
      body {
                    font-size: 16px;
                  }
                                    .group {
                    font-size: 20px;
                  }
                  .dataTables_wrapper .dataTables_paginate .paginate_button {
                    font-size: 15x;
                  }
                   .dataTables_wrapper .dataTables_scrollHeadInner table.dataTable thead th {
                    font-size: 16px;
                  }
    ")),
                
                # App title ----
                titlePanel(tags$b(tags$h1("ValiTex Checklist (Beta version 0.9)"))),
                # Subtitle and Remarks ----
                tags$style(HTML("
                .collapsible-arrow {
                  display: inline-block;
                  width: 0;
                  height: 0;
                  border-top: 5px solid transparent;
                  border-bottom: 0px solid transparent;
                  border-right: 5px solid black;
                  margin-right: 5px;
                  cursor: pointer;
                }
                ")),
                p("This checklist accompanies the ", tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank", 
                        "ValiTex"),"framework for validating text-based measures of social science constructs by Birkenmaier et al. (2023 forthcoming). 
                  The framework provides clear guidelines for best practices in validation, with a normative stance on what constitutes good validation evidence."),
                h4(
                  "Conceptual Background "),
                p("Computational methods to analyse textual data require careful validation (Grimmer and Stewart, 2013; Grimmer et al., 2022). However, social science researchers
                  often lack common terminology and a unified framework that provides guidance to do so. We present a novel validation framework for text analysis (ValiTex) that guides scholars who aim to measure social science constructs based on textual data. Conceptuall, the framework concists of two components:"),
                tags$ol(type = "1",
                  tags$li(tags$b("Conceptual Model:"),"provides a general structure along distinct phases on how to approach validation for text-based measures of social science constructs (see Figure 1, click to expand)"),
                  tags$li(tags$b("Dynamic Checklist:"),"defines and specifies specific validation steps and provides guidance on which steps are considered recommendable or optional"),),
                p("For a detailed introduction into the theoretical background of the framework, please refer to the paper [Link to preprint]"),
                div(
                  tags$img(src = "framework.png", id = "myimage", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),
                  p(class = "caption", "Figure 1: Conceptual Model (click to expand)")
                ),                h4("User Instructions for the checklist"),
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

                
                # Sidebar layout with input and output definitions ----
                verticalLayout(
                  
                  # Sidebar panel for inputs ----
                  sidebarPanel(width = 12,
                               
                               # Input: Choose dataset ----
                               selectInput("Method", "What text-based method do you want to validate? Please choose below:",
                                           choices = c("--Please select a method--","Dictionary","Supervised", "Unsupervised: Topic Model", "Unsupervised: Text Scaling"),
                                           selected = ""),
                               
                               
                               
                  ),
                  
                  # Main panel for displaying outputs ----
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
                              tags$h4(HTML(paste("Your selected text method is:",tags$b(tags$span(textOutput("value")), style = "display:inline-block;")), sep = "")),
                            
                              DT::dataTableOutput("table"),  # Change from tableOutput to dataTableOutput
                              
                            ),
                            #Button
                            # Add image below description
                  )
                  )
                ),
                padding = 30,
                tags$style(type = "text/css", "
    body {
      padding-left: 50px;
      padding-right: 50px;
      padding-bottom: 100px;
    }
  "), p(""),
                # tags$b("References"),
                # p("Birkenmaier, Lukas: Lechner, Clemens; Wagner, Claudia.(forthcomming) Navigating the complexities of validation in text as data – A novel validation framework ValiTex and applying it to detect sexisms in social media post"),
                # p("Loevinger, Jane. Objective tests as instruments of psychological theory. Psychological reports 3.3 (1957): 635-694."),
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
  
  # # Downloadable csv of selected dataset ----
  # output$downloadData <- downloadHandler(
  #   filename = function() {
  #     paste("checklist_validity_",tolower(as.character(input$Method)), ".xlsx", sep = "")
  #   },
  #   content = function(file) {
  #     writexl::write_xlsx(x = 
  #       #same filtering as above
  #       df |>
  #         dplyr::select(Phase, `Validation Step`, input$Method,"Performance Criteria", Dimension) |>
  #         dplyr::filter(!!sym(input$Method) != "n.a.") |>
  #         dplyr::rename(Status = input$Method, "Validity Dimension" = "Dimension") |> 
  #         dplyr::mutate(Check = "",.before = 1) |> 
  #         dplyr::mutate("Comments / Justification" = "",.after = 6) 
  #       , path = file,col_names = T) }
  # )
  
  # Downloadable word of selected dataset ----
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
  
}


# Run the app
shinyApp(ui = ui, server = server)