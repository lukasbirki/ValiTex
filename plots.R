df <- readxl::read_excel("data/Framework_2.xlsx")

#Robustness Checks
df %>%
    dplyr::select(Phase,  `Validation Step`,Test = "Performance Criteria", DI = Dictionary, SU = Supervised,US = "Unsupervised: Topic Model",UT = "Unsupervised: Text Scaling", 
    Dimension) %>%
    filter(Phase == "Continuous Evaluation: Robustness Checks") |> select(-Phase) |> 
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
    backgroundColor = styleEqual(c("Recommended", "Optional"), c("#f8d7da", "#d7ebf8"))) -> p1

ggsave("substantive.png")


#External Phase Checks

df %>%
  dplyr::select(Phase, `Validation Step`, DI = Dictionary, SU = Supervised,US = "Unsupervised: Topic Model",UT = "Unsupervised: Text Scaling", 
                
                Test = "Performance Criteria",
                
                Dimension) %>%
  filter(Phase == "External Phase") |> select(-Phase) |> 
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


#Structural Phase

  df %>%
    dplyr::select(Phase,  `Validation Step`,Test = "Performance Criteria", DI = Dictionary, SU = Supervised,US = "Unsupervised: Topic Model",UT = "Unsupervised: Text Scaling", 
    Dimension) %>%
    filter(Phase == "Structural Phase") |> select(-Phase) |> 
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

  
  
  df %>%
  dplyr::select(Phase, `Validation Step`,Test = "Performance Criteria", DI = Dictionary, SU = Supervised,US = "Unsupervised: Topic Model",UT = "Unsupervised: Text Scaling", 
                Dimension) %>%  filter(Phase == "Substantive Phase") |> select(-Phase) |> 
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

install.packages("webshot")
webshot::install_phantomjs()