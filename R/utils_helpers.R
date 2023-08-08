#' helpers
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
plot_file <- function(x){
  df %>%
    dplyr::select(Phase,  `Validation Step`,Considerations, Reasoning = "Performance Criteria", DI = Dictionary, SU = Supervised,US = "Unsupervised: Topic Model",UT = "Unsupervised: Text Scaling",
                  Dimension) %>%
    filter(Phase == x) |> select(-Phase) |>
    datatable(
      rownames = FALSE,
      escape = FALSE,
      class = 'cell-border stripe',
      options = list(
        ordering = FALSE,
        dom = 'rit',
        order = list(list(1, 'asc')),
        displayLength = nrow(df)
      ))  |>
    formatStyle(
      "DI",
      backgroundColor = styleEqual(c("Recommended", "Optional"), c("#f8d7da", "#d7ebf8")) ) |>
    formatStyle(
      "SU",
      backgroundColor = styleEqual(c("Recommended", "Optional"), c("#f8d7da", "#d7ebf8")) )|>
    formatStyle(
      "US",
      backgroundColor = styleEqual(c("Recommended", "Optional"), c("#f8d7da", "#d7ebf8")))|>
    formatStyle(
      "UT",
      backgroundColor = styleEqual(c("Recommended", "Optional"), c("#f8d7da", "#d7ebf8")))
}


df_daq <- data.frame(
  question = c("What is ValiTex?",
               "Why do I need to validate text-based measures?",
               "What is the basis of ValiTex?",
               "What are the components of ValiTex?",
               "How is the checklist organized?",
               "Does ValiTex consider different types of text-based measures?",
               "Are all validation steps equally important?",
               "What are the consequences of omitting certain validation steps?"),
  answer = c("ValiTex is a novel framework designed to validate computational text-based measures of social science constructs.
                It aims to provide a comprehensive perspective on measurement validation, and to provide practical guidance for researchers who want to validate computational text-based measures of social science constructs.",
             "Validating text-based measures is essential due to the inherent uncertainty associated with text data.
             Textual information is subjective and can be prone to various sources of bias, such as interpretation and misrepresentation.
             Without validation, there is a risk of misinterpreting or misclassifying the text, leading to erroneous conclusions and unreliable analyses.",
             "ValiTex builds upon the methodological research in the social sciences, particularly psychometrics, which has
             a well-established understanding of validation practices. It also incorporates insights from a recent review of validation
             practices in text-based research by Birkenmaier et al. (2023).",
             "ValiTex consists of two major components: the conceptual model and a dynamic checklist.\n- The conceptual model defines relevant validity dimensions for text-based research and provides a general structure for approaching validation.\n- The dynamic checklist characterizes empirical validation steps, grouped by overarching validity dimensions, for each phase within the conceptual model.",
             "The checklist includes a list of validation steps along with their descriptions and instructions for evaluation. It further provides reference to supplementary literature.",
             "Yes, ValiTex distinguishes between three commonly used text-based methods: \"dictionaries\" (DI), \"supervised methods\" (SU), and \"unsupervised methods.\" The latter is further divided into \"unsupervised: topic model\" (UST) and \"unsupervised: text scaling\" (USS). Certain validation steps may only be applicable to specific types of measures.",
             "No, validation steps are classified as either recommended or optional. Recommended steps are central for providing relevant and necessary validation evidence, while optional steps offer additional supporting evidence. Researchers are advised to perform all recommended steps and provide a rationale for intentionally omitting any of them.",
             "The consequences of omitting validation steps usually depends on the research context. Generally, it follows that the uncertainty over the true value of the measure increases."
  )
)



shinyLink <- function(to, label) {
  tags$a(
    class = "shiny__link",
    href = to,
    label
  )
}
