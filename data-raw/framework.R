## code to prepare `framework` dataset goes here

framework <- readxl::read_xlsx("data-raw/Framework.xlsx")
#framework <- readxl::read_xlsx("data-raw/framework.xlsx")

usethis::use_data(framework, overwrite = T)

