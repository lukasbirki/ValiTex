## code to prepare `framework` dataset goes here

framework <- readxl::read_xlsx("data-raw/Framework.xlsx")

usethis::use_data(framework, overwrite = T)

