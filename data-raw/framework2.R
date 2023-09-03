## code to prepare `framework` dataset goes here

framework2 <- readxl::read_xlsx("data-raw/framework.xlsx")
#framework <- readxl::read_xlsx("data-raw/framework.xlsx")

usethis::use_data(framework2, overwrite = T)

