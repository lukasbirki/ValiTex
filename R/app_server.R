#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  output$table <- DT::renderDT({
    framework |>
      dplyr::select(Phase,  `Validation Step`, input$Method,Considerations,"Performance Criteria",Dimension,`Source / References`,ID) |>
      dplyr::rename(Status = input$Method,
                    References = `Source / References`,
                    Reasoning = "Performance Criteria") |>
      dplyr::mutate(Status = dplyr::case_when(
        (Status == "Core" ~ "Context-Independent"),
        (Status == "Context-spefic" ~ "Context-Specific"),
        T ~ "not applicable")) |>
      dplyr::filter(Status != "not applicable") |>
      dplyr::mutate(Phase = factor(Phase, levels = c("Substantive Phase", "Structural Phase", "External Phase", "Continuous Evaluation: Robustness Checks"))) |>
      dplyr::mutate(" " = '<input type="checkbox" name="select_row">', .before = 1) -> df_output

    df_output |>
      DT::datatable(
        rownames = FALSE,
        escape = FALSE,
        class = 'cell-border stripe',
        options = list(
          pageLength = -1,
          ordering = FALSE,
          dom = 'rit',
          columnDefs = list(list(visible = FALSE, targets = 1)),
          order = list(list(1, 'asc')),
          displayLength = nrow(df),
          drawCallback = htmlwidgets::JS(
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
      DT::formatStyle(
        "Status",
        valueColumns = "Status",
        backgroundColor = DT::styleEqual(c("Context-Independent", "Context-Specific"), c("#f8d7da", "#d7ebf8")),
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
  output$Download_word <- shiny::downloadHandler(
    filename = function() {
      selected_method <- tolower(input$Method)
      if (selected_method == "a. dictionaries") {
        "checklist_A_ValiTex.docx"
      } else if (selected_method == "b. (semi-) supervised classification") {
        "checklist_B_ValiTex.docx"
      } else if (selected_method == "c. prompt-based classification using llms") {
        "checklist_C_ValiTex.docx"
      } else if (selected_method == "d. topic modelling") {
        "checklist_D_ValiTex.docx"
      }
    },
    content = function(file) {
      selected_method <- tolower(input$Method)
      if (selected_method == "a. dictionaries") {
        file.copy("data-raw/checklists/checklist_A_ValiTex.docx", file)
      }
      if (selected_method == "b. (semi-) supervised classification") {
        file.copy("data-raw/checklists/checklist_B_ValiTex.docx", file)
      }
      if (selected_method == "c. prompt-based classification using llms") {
        file.copy("data-raw/checklists/checklist_C_ValiTex.docx", file)
      }
      if (selected_method == "d. topic modelling") {
        file.copy("data-raw/checklists/checklist_D_ValiTex.docx", file)
      }

    }
  )
  output$citationOutput <- renderPrint({
    bib_entry <- "@unpublished{birkenmaier2023Valitex,
      title={ValiTex - a uniform validation framework for computational text-based measures of social science constructs},
      author={Birkenmaier, Lukas and Lechner, Clemens and Wagner, Claudia},
      archivePrefix = {arXiv},
      year={2023},
      doi = {https://doi.org/10.48550/arXiv.2307.02863},
    }"

    cat(bib_entry)
  })



  data <- data.frame(
    Use_Case = c("A", "B", "C", "D", "E", "F", "G"),
    Use_Case_Description = c(
      "Applying Dictionaries",
      "Classification using Traditional Supervised Machine Learning Model",
      "Classification using Finetuned Machine-Learning Model",
      "Zero-Shot/Few-Shot Classification (known output categories)",
      "Zero-Shot/Few-Shot Classification (unknown output categories)",
      "Topic Modelling",
      "Text Scaling"
    ),
    Learning_Approach = c(
      "Rule-Based",
      "Supervised",
      "Semi-Supervised",
      "Semi-Supervised",
      "Unsupervised",
      "Unsupervised",
      "Unsupervised"
    ),
    Training_Finetuning_Required = c("No", "Yes", "Yes", "No", "No", "No", "No"),
    Known_Output_Categories = c("Yes", "Yes", "Yes", "Yes", "No", "No", "Yes"),
    Description = c(
      "Assign scores to text units using predefined word lists",
      "Assign known output categories based on labelled training data",
      "Assign known output categories based on a fine-tuning process on a small subset of labelled data",
      "Assign known output categories without any finetuning on labelled data",
      "Assign unknown output categories without any finetuning on labelled data",
      "Assign topics without any labeled data",
      "Assign scale scores without any labelled data"
    ),
    Example = c(
      "A dictionary assigns polarity values ranging from -1 to 1 to each known text unit",
      "A Logistic regression model is trained on labelled customer reviews and predicts 'positive' and 'negative' reviews",
      "A pretrained BERT model is fine-tuned on labelled social media posts and predicts 'offensive' and 'non-offensive' posts",
      "GPT-3 predicts 'political' or 'non-political' speeches",
      "GPT-3 suggests topics for texts (not prescribed by the researcher)",
      "An LDA topic model generates 13 topics coherent topics",
      "A Wordfish model assigns scale values from -1 to 1 to politicians’ speeches"
    )
  )

  output$mytable_use_cases <- renderTable({
    data
  }, rownames = FALSE)


}
