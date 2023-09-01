## code to prepare `framework` dataset goes here

load("data-raw/framework.rda")
#framework <- readxl::read_xlsx("data-raw/framework.xlsx")

usethis::use_data(framework)
