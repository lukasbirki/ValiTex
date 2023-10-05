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
                                    p("ValiTex is a novel validation framework for computational text-based measures of social science constructs",tags$a(href="https://arxiv.org/abs/2307.02863",target="_blank",
                                                                                                                                                                  "(Birkenmaier et al., 2023)."),"The framework offers practical guidance for researchers and users to conduct and communicate validation."),

                                    h3("Overview"),
                                    p("Validation is a critical task in text analysis and natural language processing.
                               As its core, validation requires different activities to demonstrate that a method measures what it purports to measure ",
                                      tags$a(href="https://psycnet.apa.org/record/1951-06471-001",target="_blank",
                                             "(Cureton, 1951)."),
                               " However, validating text-based measures can be challenging",tags$a(href="https://methods.sagepub.com/book/content-analysis-4e",target="_blank",
                                                                                                    "(Krippendorf, 2018).")),

                                    p("Therefore, any empirical measure needs to be validated. One crucial problem in the validation of text-based measures, however, is the lack of concepual clarity on how to conduct validation.

                                    To provide practical guidance for researchers and users to conduct and communicate validation, ValiTex provides a flexible and consistent appraoch to validation."),
                               p("At its core, ValiTex requires three types of validation evidence: substantive, structural, and external evidence"),
                               tags$ul(
                                 tags$li(p(tags$b(tags$code("Substantive Evidence:")), "Requires to outline the",tags$b(" theoretical underpinning")," of the measure.")),
                                 tags$li(p(tags$b(tags$code("Structural Evidence:")), "Requires to examine and evaluate",tags$b("properties of the model and its measures"),)),
                                 tags$li(p(tags$b(tags$code("External Evidence:")), "Requires to test for how the measure relates to",tags$b("other independent information or criteria"),)),),
                                  p("The framework is complemented by a checklist that defines and outlines empirical validation steps available to collect validity evidence for different use cases."),
                               p("If you want to learn more about the framework and the checklist, please click on the respective section below or have a look at our",tags$a(href="https://arxiv.org/abs/2307.02863",target="_blank",
                                                              "Working Paper.")),


                                    tags$style(
                                      HTML(".tabset { width: 80%; }")
                                    ),
                                    div(style = "width: 95%; margin: auto;",tabsetPanel(
                                      tabPanel(
                                        title = HTML(paste('<span class="glyphicon glyphicon-home"></span>', "Framework")),
                                        value = "r",
                                        h3("Framework"),
                                        p("The framework is rooted in the well-established principles of measurement theory found within the psychometric literature which offers the most comprehensive and cohesive conception of validity for social science research.
                                          The complete framework is visually depicted in Figure 1."),

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
                                            p(class = "caption", "Figure 2: Screenshot Checklist (click to expand)")),)),
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
                                                 span(style="color:#96caed; font-weight: bold", "optional "),"depending on their relevance.", sep = "")),
                                      # tags$img(
                                      #   src = "www/use_cases.png",
                                      #   style = "display: block; margin: 0 auto; width: 50%;"
                                      # ),
                                      p("ValiTex accounts for different use cases in validation practices across text-based methods and research contexts.
                                        At present, ValiTex differentiates between seven use cases, which are highlighted in the Table below (click on it for a detailed view)"),
                                      div(
                                        tags$img(src = "www/use_cases.png", id = "myimage", style = "margin-top: 40px;margin-bottom: 0px; cursor: pointer;"),
                                        p(class = "caption", "Table: Use Cases (click to expand)")),

                                      tags$p(tags$b("Please start by choosing a method from the drop-down menu below."), "The complete list of validation steps is also available on ",
                                             tags$a(href="https://github.com/lukasbirki/ValiTex-Checklist/tree/main/data",target="_blank",
                                                    "Github.")),


                                      # Sidebar layout with input and output definitions
                                      verticalLayout(
                                        # Sidebar panel for inputs
                                        sidebarPanel(width = 12,

                                                     # Input: Choose dataset
                                                     selectInput("Method", "What text-based method do you want to validate? Please choose below:",
                                                                 choices = c("--Please select a method--",
                                                                             "A. Applying Dictionaries",
                                                                             "B. Classification using Traditional Supervised Machine Learning Model",
                                                                             "C. Classification using Finetuned Machine-Learning Model",
                                                                             "D. Zero-Shot/Few-Shot Classification (known output categories)",
                                                                             "E. Zero-Shot/Few-Shot Classification (unknown output categories)",
                                                                             "F. Text Scaling",
                                                                             "G. Topic Modelling"),
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
