df_daq <- data.frame(
  question = c("What is ValiTex?",
               "What is the basis of ValiTex?",
               "How does ValiTex approach validation?",
               "What are the components of ValiTex?",
               "How is the checklist organized?",
               "Does ValiTex consider different types of text-based measures?",
               "Are all validation steps equally important?"),
  answer = c("ValiTex is a novel framework designed to validate computational text-based measures of social science constructs. 
                It provides researchers with tools and guidance to navigate the validation process for text-based research.",
             "ValiTex builds upon the methodological research in the social sciences, particularly psychometrics, which has a well-established understanding of validation practices. 
                It also incorporates insights from a recent review of validation practices in text-based research by Birkenmaier et al. (2023).",
             "ValiTex follows three key principles:\n1. Organizing the validation process across key phases outlined in the psychometric tradition.\n2. Applying different validation steps within each phase, with some steps being more relevant for demonstrating measurement validity.\n3. Including continuous evaluation of the measure's robustness towards researchers' degree of freedom or context-specific factors.",
             "ValiTex consists of two major components: the conceptual model and a dynamic checklist.\n- The conceptual model defines relevant validity dimensions for text-based research and provides a general structure for approaching validation.\n- The dynamic checklist characterizes empirical validation steps, grouped by overarching validity dimensions, for each phase within the conceptual model.",
             "The checklist includes a list of validation steps along with their descriptions and instructions for evaluation. It may incorporate common cut-off criteria and references to supplementary literature where applicable.",
             "Yes, ValiTex distinguishes between three commonly used text-based methods: \"dictionaries\" (DI), \"supervised methods\" (SU), and \"unsupervised methods.\" The latter is further divided into \"unsupervised: topic model\" (UST) and \"unsupervised: text scaling\" (USS). Certain validation steps may only be applicable to specific types of measures.",
             "No, validation steps are classified as either recommended or optional. Recommended steps are central for providing relevant and necessary validation evidence, while optional steps offer additional supporting evidence. Researchers are advised to perform all recommended steps and provide a rationale for intentionally omitting any of them."
  )
)


shinyLink <- function(to, label) {
  tags$a(
    class = "shiny__link",
    href = to,
    label
  )
}
