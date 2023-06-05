plot_file <- function(x){
  df %>%
    dplyr::select(Phase,  `Validation Step`,Test = "Performance Criteria", DI = Dictionary, SU = Supervised,US = "Unsupervised: Topic Model",UT = "Unsupervised: Text Scaling", 
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
