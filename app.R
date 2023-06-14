library(tidyverse)
library(DT)
library(shinythemes)
library(shinyjs)
library(shinyBS)
library(RefManageR)
library(shinydashboard)
library(faq)
library(prompter)
source("faq.R")

df <- readxl::read_excel("data/Framework.xlsx")


code <- list(
  js = paste0(readLines("shinyLink.js"), collapse = "\n")
)

ui <- fluidPage(theme = "flatly",
                useShinyjs(),
                use_prompt(),
                includeCSS("styles.css"),
                windowTitle = "ValiTex",  # Text displayed in the browser window title
                navbarPage(title = "ValiTex",
                           theme = "navbar-default",
                #Background ----
                tabPanel("Home",
                         value = "home",
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
                tags$ul(type = "A",
                  tags$li(tags$b("Conceptual Model:"),"General structure along distinct phases on how to approach validation"),
                  tags$li(tags$b("Dynamic Checklist:"),"A list of concrete validation steps for each phase"),),
                p("For a detailed introduction into the theoretical background of the framework, please refer to the paper [Link to preprint] or click on the respective component below"),
                
                tags$style(
                  HTML(".tabset { width: 80%; }")
                ),
                div(style = "width: 95%; margin: auto;",tabsetPanel(
                  tabPanel(
                    title = "Conceptual Model",
                    value = "r",
                    h3("Conceptual Model"),
                    p("The conceptual model defines three major phases which researchers should follow when validating computational text-based measures. These Phases are"),
                    tags$ul(
                    tags$li(p(tags$code("Substantive Phase:"), "Demonstrate the theoretical underpinning of the measures")),
                    tags$li(p(tags$code("Structural Phase:"), "Evaluate the characteristics of the textual model and its output")),
                    tags$li(p(tags$code("External Phase:"), "Test how the measures relates to unrelated measures or information")),
                    
                    
                      ),
                    
                    div(
                      tags$img(src = "framework.png", id = "myimage", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),
                      p(class = "caption", "Figure 1: Conceptual Model (click to expand)"))
                    ),
                  tabPanel(
                    title = "Checklist",
                    value = "r",
                    h3("Checklist"),
                    p("The dynamic checklist within ValiTex defines and characterizes empirical validation steps, organized based on overarching validity dimensions. It provides a comprehensive list of validation steps with descriptions, evaluation instructions, and references to supplementary literature."),
                    div(tags$img(src = "checklist.png", id = "myimage", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),
                        p(class = "caption", "Figure 2: Screenshot Checklist (click to expand)"))
                    ,
                  )),
                  div(class = "footer",
                      p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "lukas.birkenmaier@gesis.org"),
                        
                        p("This work is licensed under a",
                          a("Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0)",
                            href = "https://creativecommons.org/licenses/by-nc/4.0/",
                            target = "_blank"))))),
                
               ),
                #Checklist----
                tabPanel("Checklist",
                         h3("User Instructions", add_prompt(
                           tags$span(
                             class = "question-button",
                             "?"), 
                           position = "bottom", message = "For more information, see xx and y"
                         ),),
                         p(HTML(paste("This application generates an adaptable checklist that you can use to validate your text-based measures. 
                Each row within the table corresponds to one validation step (i.e., a single reported and clearly demarcated validation activity). Validation steps can be either ", 
                                      span(style="color:#ed969e; font-weight: bold", "recommended "), "or ", 
                                      span(style="color:#96caed; font-weight: bold", "optional "),"depending on their relevance.", sep = ""),"As outlined in the corresponding paper, researchers should initially follow the order of the phases, starting with the substantive validation steps and ending with external validation steps while continuously considering robustness checks. 
                However, researchers might adapt this process to their individual use case."),
                           p("ValiTex accounts for differences in validation practices across text-based methods and research contexts. At present, ValiTex differentiates between four broad types of text-based methods:"),
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
  tags$h4(HTML(paste("Your selected text method is:",tags$b(tags$span(textOutput("value")), style = "display:inline-block;")), sep = "")),
  
  DT::dataTableOutput("table"),  # Change from tableOutput to dataTableOutput
  
),

                             )
                           )
                         ),
  div(class = "footer",
      p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "lukas.birkenmaier@gesis.org"),
        
        p("This work is licensed under a",
          a("Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0)",
            href = "https://creativecommons.org/licenses/by-nc/4.0/",
            target = "_blank"))))
                         
                         ),
#FaQ----
tabPanel("FAQ",
         h3("Frequently asked questions"),
         p("Here you will find answers to frequently asked questions about ValiTex If you have any questions that are not addressed here, please feel free to contact us!
            For a detailed description of the ValiTex framework, please refer to the",tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank", 
                                                                                                           "working paper.")),
div(faq::faq(data = df_daq, elementId = "faq", faqtitle = "")),
),

#Feedback ----
                tabPanel("Feedback",
                         id = "tab_feedback",
                         h3("Feedback"),
                         p("Please note this application is currently under construction and evolution.
                         Please feel free to reach out to us with any feedback you have. We are eager to hear from you and will take your suggestions into consideration as we continue to develop and enhance our website. To reach us, please refer to lukas.birkenmaier@gesis.org.
 "),
                         h3("Citation"),
                         p("When refering to the site or the corresponding workin paper in publications, please cite the following references:"),
                         p("Birkenmaier, Lukas; Lechner, Clemens; Wagner, Claudia. (2023).",tags$em("ValiTex - a uniform validation framework for computational text-based measures of social science constructs."), "[Link to Arxiv DOI, tba. soon]"),
                         verbatimTextOutput("citationOutput"),
                         
                         div(class = "footer",
                             p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "lukas.birkenmaier@gesis.org"),
                               
                               p("This work is licensed under a",
                                 a("Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0)",
                                   href = "https://creativecommons.org/licenses/by-nc/4.0/",
                                   target = "_blank"))))
                         ),    
                ),

  

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