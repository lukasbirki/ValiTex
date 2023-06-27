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
                windowTitle = "ValiTex Framework",  # Text displayed in the browser window title
                navbarPage(title = "ValiTex",
                           theme = "navbar-default",
                #Background ----
                tabPanel("Home",
                         value = "home",
                         h2("ValiTex - A Validation Framework for Computational Text-based Measures of Social Science Constructs", align = "center"),
                         h4("Beta Version 0.9", align = "center"),
                h3("About"),
                         p("This webpage accompanies the ", tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank", 
                        "ValiTex"),"framework by", tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank", 
                                                          "Birkenmaier et al. (2023)."),
                  "The framework is designed to help researchers that aim to measure social science constructs using computational text analysis to validate their empirical measures."),
                h3("Overview"),
                                p("Validation is a critical task in text analysis and natural language processing. 
                               As its core, validation requires different activities to demonstrate that a method measures what it purports to measure. 
                               Recently, there has been a skyrocketing number of studies using computational text analysis to measure social science constructs from text, 
                               such as sexism, populist language, or ideology. 
                               However, validating these measures is challenging, especially because textual data can often be interpreted differently."),
                              p("One crucial problem in the validation of text-based measures is the lack of concepual clarity of how to conduct validation. 
                              This expresses itself, among others, in the absence of commonly-shared terminology and general framework that provides guidance to do so. 
                                To guide researchers who aim to measure social science constructs based on textual data, we therefore present a novel validation framework for text analysis called ValiTex. 
                                Conceptually, the framework consists of two components:"),
                tags$ul(
                  tags$li(
                    style = "margin-bottom: 10px;",
                    tags$span(class = "glyphicon glyphicon-home"),
                    tags$b("Conceptual Model:"),
                    "General structure along distinct phases on how to approach validation"),
                tags$li(
                  tags$span(class = "glyphicon glyphicon-check"),
                  
                    tags$b("Checklist:"),"A list of concrete validation steps for each phase of the conceptual model"),),
                p("If you want to learn more about the components of ValiTex, please click on the respective 
                  section below or have a look at our",tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank", 
                                                                "Working Paper.")),
      
                tags$style(
                  HTML(".tabset { width: 80%; }")
                ),
                div(style = "width: 95%; margin: auto;",tabsetPanel(
                  tabPanel(
                    title = HTML(paste('<span class="glyphicon glyphicon-home"></span>', "Conceptual Model")),
                    value = "r",
                    h3("Conceptual Model"),
                    p("The conceptual model defines three major phases which researchers should follow when validating computational text-based measures:"),
                    tags$ul(
                    tags$li(p(tags$b(tags$code("Substantive Phase:")), "The substantive phase comprises the",tags$b(" theoretical underpinning")," of the measure.
                              It entails all validation steps which ensure the adequacy of the measurement process regarding the operationalization of the construct." 
                              )),
                    tags$li(p(tags$b(tags$code("Structural Phase:")), "The structural phase includes the evaluation of the",tags$b("properties of the model and its measures"),
                    "It entails all validation steps to carefully examine and evaluate the characteristics of the textual model and its output and to identify  biases or errors.")),
                    tags$li(p(tags$b(tags$code("External Phase:")), "The external phase comprises the",tags$b("relationship with unrelated information."),
                              "It entails all validation steps that tests for how the measures relate to to independent measures or exogenous events." 
                              )),),
                    div(
                      tags$img(src = "framework.png", id = "myimage", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),
                      p(class = "caption", "Figure 1: Conceptual Model (click to expand)")),
                    ),
                  tabPanel(
                    title = HTML(paste('<span class="glyphicon glyphicon-check"></span>', "Checklist")),
                    value = "r",
                    h3("Checklist"),
                    p("The dynamic checklist then provides a comprehensive list of validation steps for each phase within the structural model. 
                    Each validation step comes with a set of information, such as",
                    
                    tags$table(  style = "border-collapse: separate; border-spacing: 11px;",

                      tags$tr(
                        tags$th("Variable"),
                        tags$th("Information")
                      ),
                      tags$tr(
                        tags$td(tags$code("Status")),
                        tags$td("Relevance of the validation step (either recommended or optional)")
                      ),
                      tags$tr(
                        tags$td(tags$code("Considerations")),
                        tags$td("Detailed description of the validation step")
                      ),
                      tags$tr(
                        tags$td(tags$code("Reasoning")),
                        tags$td("Information on how to evaluate the validation step ")
                      ),
                      tags$tr(
                        tags$td(tags$code("Dimension")),
                        tags$td("The type of validation step as defined in the conceptual model")
                      ),

                      tags$tr(
                        tags$td(tags$code("References")),
                        tags$td("Reference to further literature and information")
                      )
                    )),
                    p("To use the checklist in your research just click on",tags$b("Get Started")," in the navigation bar. 
                      There, you can generate your own checklist depending on the type of text method used. Furthermore, you will be able to 
                      download a Word template which you can fill out on your own and attach to your publication."),
                    div(tags$img(src = "checklist.png", id = "myimagecheck", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),

                        p(class = "caption", "Figure 2: Screenshot Checklist (click to expand)"))
                    ,
                  )),
                  div(class = "footer",
                      p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "lukas.birkenmaier@gesis.org"),
                        " | See also the repository on GitHub!",
                        a(
                          icon("github"),
                          href = "https://github.com/lukasbirki/ValiTex-Checklist",
                          target = "_blank",
                          style = "color: #000000; font-size: 24px; margin-right: 10px;"
                        )                               ,
                        p("This work is licensed under a",
                          a("Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0)",
                            href = "https://creativecommons.org/licenses/by-nc/4.0/",
                            target = "_blank")))))
                
               ),
                #Checklist----
                tabPanel("Get Started",
                         h3("User Instructions"),
                         p(HTML(paste("This application generates an adaptable checklist that you can use to validate your text-based measures. 
                Each row within the table corresponds to one validation step (i.e., a single reported and clearly demarcated validation activity). Validation steps can be either ", 
                                      span(style="color:#ed969e; font-weight: bold", "recommended "), "or ", 
                                      span(style="color:#96caed; font-weight: bold", "optional "),"depending on their relevance.", sep = ""),"As outlined in the corresponding paper, researchers should initially follow the order of the phases, starting with the substantive validation steps and ending with external validation steps while continuously considering robustness checks. 
                However, researchers might adapt this process to their individual use case."),
                           p("ValiTex accounts for differences in validation practices across text-based methods and research contexts. At present, ValiTex differentiates between four broad types of text-based methods:"),
                           tags$ul(tags$li(tags$b("Dictionary:"),"Rule-based methods that include words or phrases along with their respective meanings or sentiments",add_prompt(tags$span(class = "question-button", "?"), 
                                                                                                                                                                                  position = "bottom", message = "E.g., SentiWS, LIWC")),
                                   tags$li(tags$b("Supervised:"),"Machine-learning methods that include some form of training data and test set and classification task",add_prompt(tags$span(class = "question-button", "?"), 
                                                                                                                                                                                       position = "bottom", message = "E.g., Logistic regressiion, CNN, BERT")),
                                   tags$li(tags$b("Unsupervised (Topic Model):"),"Unsupervised methods that generate topics based on word-coocurrences",add_prompt(tags$span(class = "question-button", "?"), 
                                                                                                                                                                  position = "bottom", message = "E.g., Latent Dirichlet Allocation (LDA)")),
                                   tags$li(tags$b("Unsupervised (Text Scaling)"),"Unsupervised methods that produce scores that relate to some underlying scale based on word-coocurrences", add_prompt(tags$span(class = "question-button", "?"), 
                                                                                                                                                                                                        position = "bottom", message = "E.g., Wordfish, Wordscores")),
                           ),
                           tags$p(tags$b("Please start by choosing a method from the drop-down menu below."), "The complete list of validation steps is also available on ",
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

  $(document).on("click", "#myimagecheck", function() {
    if ($(this).hasClass("expanded")) {
      $(this).removeClass("expanded");
      $(this).css("max-width", "30%");
    } else {
      $(this).addClass("expanded");
      $(this).css("max-width", "90%");
    }
  })'),
  conditionalPanel(tags$style(HTML('.group {background-color: #ccc !important;margin: auto;}')),
  condition = "input.Method != '--Please select a method--'",  # Only show table when Method input is not empty
  # downloadButton("downloadData", "Download (Excel)",
  #                style = "float: right; margin-left: 10px;"),
    div(
  style = "text-align: center;", 
  h4(HTML(paste("Your selected text method is:",tags$b(tags$span(textOutput("value")), style = "display:inline-block;")), sep = "")),
  
  
  p(span(class = "glyphicon glyphicon-info-sign", style = "margin-right: 5px;"),
  "To document validation steps using the checklist, we recommend to download the Word Template below"),
  
  downloadButton("Download_word", "Download (Word)")
 ),
  DT::dataTableOutput("table", width = "100%"),  
  
  tags$div(
    style = "font-size: 12px; margin-top: 10px; text-align: center;",
    HTML(paste(
      "<b>References</b><br>",
      "Adcock, Robert, and David Collier. <i>Measurement validity: A shared standard for qualitative and quantitative research</i>. American political science review 95, no. 3 (2001): 529–46.<br>",
      "Atteveldt, Wouter van, Mariken ACG van der Velden, and Mark Boukes. <i>The Validity of Sentiment Analysis: Comparing Manual Annotation, Crowd-Coding, Dictionary Approaches, and Machine Learning Algorithms</i>. Communication Methods and Measures 15, no. 2 (2021): 121–40.<br>",
      "Baden, Christian, Neta Kligler-Vilenchik, and Moran Yarchi. <i>Hybrid Content Analysis: Toward a Strategy for the Theory-Driven, Computer-Assisted Classification of Large Text Corpora</i>. Communication Methods and Measures 14, no. 3 (2020): 165–83.<br>",
      "Boukes, Mark, Bob Velde, Theo Araujo, and Rens Vliegenthart. <i>What’s the Tone? Easy Doesn’t Do It: Analyzing Performance and Agreement Between Off-the-Shelf Sentiment Analysis Tools</i>. Communication Methods and Measures 14 (October 17, 2019): 1–22.<br>",
      "Chang, Jonathan, Sean Gerrish, Chong Wang, Jordan Boyd-graber, and David Blei. <i>Reading Tea Leaves: How Humans Interpret Topic Models</i>. In Advances in Neural Information Processing Systems, vol. 22. Curran Associates, Inc., 2009.<br>",
      "Clark, Lee Anna, and David Watson. <i>Constructing validity: New developments in creating objective measuring instruments</i>. Psychological assessment 31, no. 12 (2019): 1412.<br>",
      "Denny, Matthew J., and Arthur Spirling. <i>Text Preprocessing For Unsupervised Learning: Why It Matters, When It Misleads, And What To Do About It</i>. Political Analysis 26, no. 2 (April 2018): 168–89.<br>",
      "Goet, Niels D. <i>Measuring polarization with text analysis: evidence from the UK House of Commons, 1811–2015</i>. Political Analysis 27, no. 4 (2019): 518–39.<br>",
      "Grimmer, Justin, and Brandon M. Stewart. <i>Text as data: The promise and pitfalls of automatic content analysis methods for political texts</i>. Political analysis 21, no. 3 (2013): 267–97.<br>",
      "Grimmer, Justin, Margaret E. Roberts, and Brandon M. Stewart. <i>Text as Data: A New Framework for Machine Learning and the Social Sciences</i>. Princeton Oxford: Princeton University Press, 2022.<br>",
      "Huang, Leslie, Patrick O. Perry, and Arthur Spirling. <i>A General Model of Author “Style” with Application to the UK House of Commons, 1935–2018</i>. Political Analysis 28, no. 3 (July 2020): 412–34.<br>",
      "Jankowski, Michael, and Robert A. Huber. <i>When Correlation Is Not Enough: Validating Populism Scores from Supervised Machine-Learning Models</i>. OSF Preprints, January 21, 2022.<br>",
      "Krippendorff, Klaus. <i>Content analysis: An introduction to its methodology</i>. Sage publications, 2018.<br>",
      "Müller, Stefan. <i>Media Coverage of Campaign Promises Throughout the Electoral Cycle</i>. Political Communication 37, no. 5 (September 2, 2020): 696–718.<br>",
      "Röttger, Paul, Bertie Vidgen, Dong Nguyen, Zeerak Waseem, Helen Margetts, and Janet Pierrehumbert. <i>HateCheck: Functional Tests for Hate Speech Detection Models</i>. In Proceedings of the 59th Annual Meeting of the Association for Computational Linguistics and the 11th International Joint Conference on Natural Language Processing (Volume 1: Long Papers), 41–58. Online: Association for Computational Linguistics, 2021.<br>",
      "Sen, Indira, Fabian Flöck, Katrin Weller, Bernd Weiß, and Claudia Wagner. <i>A Total Error Framework for Digital Traces of Human Behavior on Online Platforms</i>. Public Opinion Quarterly 85, no. S1 (2021): 399–422.<br>",
      "Van Der Velden, Mariken, Gijs Schumacher, and Barbara Vis. <i>Living in the Past or Living in the Future? Analyzing Parties’ Platform Change In Between Elections, The Netherlands 1997–2014</i>. Political Communication 35, no. 3 (July 3, 2018): 393–412.<br>",
      "Wu, Tongshuang, Marco Tulio Ribeiro, Jeffrey Heer, and Daniel Weld. <i>Errudite: Scalable, Reproducible, and Testable Error Analysis</i>. In Proceedings of the 57th Annual Meeting of the Association for Computational Linguistics, 747–63. Florence, Italy:2019.<br>",
      "Yarchi, Moran, Christian Baden, and Neta Kligler-Vilenchik. <i>Political Polarization on the Digital Sphere: A Cross-Platform, Over-Time Analysis of Interactional, Positional, and Affective Polarization on Social Media</i>. Political Communication 38, no. 1–2 (March 15, 2021): 98–139.<br>",
      "Ying, Luwei, Jacob M. Montgomery, and Brandon M. Stewart. <i>Topics, concepts, and measurement: a crowdsourced procedure for validating topics as measures</i>. Political Analysis 30, no. 4 (2022): 570–89.<br>",
      "Zhang, Jiawei, Yang Wang, Piero Molino, Lezhi Li, and David S. Ebert. <i>Manifold: A model-agnostic framework for interpretation and diagnosis of machine learning models</i>. IEEE transactions on visualization and computer graphics 25, no. 1 (2018): 364–73.<br>"
      
    ))
  )
  
  
  
  ),

  
                             )),
                         ),
 div(class = "footer",
     p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "lukas.birkenmaier@gesis.org"),
       " | See also the repository on GitHub!",
       a(
         icon("github"),
         href = "https://github.com/lukasbirki/ValiTex-Checklist",
         target = "_blank",
         style = "color: #000000; font-size: 24px; margin-right: 10px;"
       )                               ,
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
                         p("Please note that this application is currently under construction and evolution.
                         Please feel free to reach out to us with any feedback you have. We are eager to hear from you and will take your suggestions into consideration as we continue to develop and enhance our website. To reach us, please refer to lukas.birkenmaier@gesis.org.
 "),
                         h3("Citation"),
                         p("When refering to the site or the corresponding workin paper in publications, please cite the following references:"),
                         p("Birkenmaier, Lukas; Lechner, Clemens; Wagner, Claudia. (2023).",tags$em("ValiTex - a uniform validation framework for computational text-based measures of social science constructs."), "[Link to Arxiv DOI, tba. soon]"),
                         verbatimTextOutput("citationOutput"),
                         
                         div(class = "footer",
                             p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "lukas.birkenmaier@gesis.org"),
                               " | See also the repository on GitHub!",
                                a(
                                   icon("github"),
                                   href = "https://github.com/lukasbirki/ValiTex-Checklist",
                                   target = "_blank",
                                   style = "color: #000000; font-size: 24px; margin-right: 10px;"
                                 )                               ,
                               p("This work is licensed under a",
                                 a("Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0)",
                                   href = "https://creativecommons.org/licenses/by-nc/4.0/",
                                   target = "_blank")))),

                         ),    

                ),
)


server <- function(input, output) {
  output$table <- renderDT({
    df |>
      dplyr::select(Phase, `Validation Step`, input$Method,Considerations,"Performance Criteria",Dimension,`Source / References`) |>
      dplyr::filter(!!sym(input$Method) != "n.a.") |>
      dplyr::rename(Status = input$Method, References = `Source / References`, Reasoning = "Performance Criteria") |>
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
  
  
  # Downloadable word files of selected dataset 
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