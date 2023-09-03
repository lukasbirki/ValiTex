## code to prepare `framework` dataset goes here

framework <- load("data-raw/framework.rda")
framework2 <- readxl::read_xlsx("data-raw/framework.xlsx")
#framework <- readxl::read_xlsx("data-raw/framework.xlsx")

usethis::use_data(framework)
usethis::use_data(framework2)

