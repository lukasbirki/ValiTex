#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    tagList(
      fluidPage(theme = "flatly",
                shinyjs::useShinyjs(),
                prompter::use_prompt(),
                windowTitle = "ValiTex Framework",  # Text displayed in the browser window title
                navbarPage(title = "ValiTex",
                           theme = "navbar-default",
                           #Background ----
                           tabPanel("Home",

                                    value = "home",
                                    h2("ValiTex - A Validation Framework for Computational Text-based Measures of Social Science Constructs", align = "center"),
                                    h4("Beta Version 0.9", align = "center"),
                                    fluidRow(
                                      column(width = 12, align = "center",
                                             img(src = "www/logo_valitex.png", width = 90)  # Adjust the width as needed
                                      )
                                    ),
                                    h3("About"),
                                    p("This webpage accompanies the ", tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist",target="_blank",
                                                                              "ValiTex"),"framework by", tags$a(href="https://arxiv.org/abs/2307.02863",target="_blank",
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
                  section below or have a look at our",tags$a(href="https://arxiv.org/abs/2307.02863",target="_blank",
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
                                          tags$img(src = "www/framework.png", id = "myimage", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),
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
                                        div(tags$img(src = "www/checklist.png", id = "myimagecheck", style = "margin-top: 40px;margin-bottom: 40px; cursor: pointer;"),

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
                           #Get Started----
                           tabPanel("Get Started",
                                    h3("User Instructions"),
                                    p(HTML(paste("This application generates an adaptable checklist that you can use to validate your text-based measures.
                Each row within the table corresponds to one validation step (i.e., a single reported and clearly demarcated validation activity). Validation steps can be either ",
                                                 span(style="color:#ed969e; font-weight: bold", "recommended "), "or ",
                                                 span(style="color:#96caed; font-weight: bold", "optional "),"depending on their relevance.", sep = ""),"As outlined in the corresponding paper, researchers should initially follow the order of the phases, starting with the substantive validation steps and ending with external validation steps while continuously considering robustness checks.
                However, researchers might adapt this process to their individual use case."),
                                      p("ValiTex accounts for differences in validation practices across text-based methods and research contexts. At present, ValiTex differentiates between the three main types of text-based methods. Furthermore, there is an option to select validation for APIs:"),
                                      tags$ul(tags$li(tags$b("Dictionary:"),"Rule-based methods that include words or phrases along with their respective meanings or sentiments",prompter::add_prompt(tags$span(class = "question-button", "?"),
                                                                                                                                                                                                       position = "bottom", message = "E.g., SentiWS, LIWC")),
                                              tags$li(tags$b("Supervised:"),"Machine-learning methods that include some form of training data and test set and classification task",prompter::add_prompt(tags$span(class = "question-button", "?"),
                                                                                                                                                                                                         position = "bottom", message = "E.g., Logistic regressiion, CNN, BERT")),
                                              tags$li(tags$b("Unsupervised (Topic Model):"),"Unsupervised methods that generate topics based on word-coocurrences",prompter::add_prompt(tags$span(class = "question-button", "?"),
                                                                                                                                                                                        position = "bottom", message = "E.g., Latent Dirichlet Allocation (LDA)")),
                                              tags$li(tags$b("Unsupervised (Text Scaling)"),"Unsupervised methods that produce scores that relate to some underlying scale based on word-coocurrences", prompter::add_prompt(tags$span(class = "question-button", "?"),
                                                                                                                                                                                                                             position = "bottom", message = "E.g., Wordfish, Wordscores")),
                                              tags$li(tags$b("API (Application Programming Interfaces)"),"Interfaces which process texts with no access to the respective text model", prompter::add_prompt(tags$span(class = "question-button", "?"),
                                                                                                                                                                                                            position = "bottom", message = "E.g., ChatGPT API, Perspective API for toxicity"),tags$i("(still under development)")),
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
                                                                 choices = c("--Please select a method--","Dictionary","Supervised", "Unsupervised: Topic Model", "Unsupervised: Text Scaling","API"),
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
                                                                       "tba"

                                                                     ))
                                                                   )



                                                  ),


                                        )),
                                    ),
                                    div(class = "footer",
                                        p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "mailto:lukas.birkenmaier@gesis.org"),
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
                         Please feel free to reach out to us with any feedback you have. We are eager to hear from you and will take your suggestions into consideration as we continue to develop and enhance our website.
                         To reach us, please refer to", a("lukas.birkenmaier@gesis.org",href = "lukas.birkenmaier@gesis.org")),
                                    h3("Citation"),
                                    p("When refering to the site or the corresponding workin paper in publications, please cite the following references:"),
                                    p("Birkenmaier, Lukas; Lechner, Clemens; Wagner, Claudia. (2023).",
                                      tags$em("ValiTex - a uniform validation framework for computational text-based measures of social science constructs."),
                                      a("https://doi.org/10.48550/arXiv.2307.02863",
                                        href = "https://doi.org/10.48550/arXiv.2307.02863",
                                        target = "_blank") ),
                                    verbatimTextOutput("citationOutput"),

                                    div(class = "footer",
                                        p("Contact:",a(" lukas.birkenmaier@gesis.org", href = "mailto:lukas.birkenmaier@gesis.org"),
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
      ))


    )

}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "ValiTex"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
