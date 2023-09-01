#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  output$table <- DT::renderDT({
    #data(framework)
    framework |>
      dplyr::select(Phase,  `Validation Step`, input$Method,Considerations,"Performance Criteria",Dimension,`Source / References`,ID) |>
      dplyr::rename(Status = input$Method,
                    References = `Source / References`,
                    Reasoning = "Performance Criteria") |>
      dplyr::mutate(Status = dplyr::case_when(
        (Status == "R" ~ "Recommended"),
        (Status == "O" ~ "Optional"),
        T ~ "n.a.")) |>
      dplyr::filter(Status != "n.a.") |>
      dplyr::mutate(Phase = factor(Phase, levels = c("Substantive Phase", "Structural Phase", "External Phase", "Continuous Evaluation: Robustness Checks"))) |>
      dplyr::mutate(" " = '<input type="checkbox" name="select_row">', .before = 1) -> df_output

    df_output |>
      DT::datatable(
        rownames = FALSE,
        escape = FALSE,
        class = 'cell-border stripe',
        options = list(
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
        backgroundColor = DT::styleEqual(c("Recommended", "Optional"), c("#f8d7da", "#d7ebf8")),
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
      paste("checklist_validity_",tolower(as.character(input$Method)), ".docx", sep = "")
    },
    content = function(file) {
      if (input$Method == "Dictionary") {
        file.copy("data-raw/checklists/checklist_dictionary.docx", file)
      }
      if (input$Method == "Supervised") {
        file.copy("data-raw/checklists/checklist_supervised.docx", file)
      }
      if (input$Method == "Unsupervised: Topic Model") {
        file.copy("data-raw/checklists/checklist_unsupervised_TM.docx", file)
      }
      if (input$Method == "Unsupervised: Text Scaling") {
        file.copy("data-raw/checklists/checklist_unsupervised_TS.docx", file)
      }
      if (input$Method == "API") {
        file.copy("data-raw/checklists/checklist_API.docx", file)
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


}
