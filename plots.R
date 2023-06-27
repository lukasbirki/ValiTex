source("helpers.R")
library(webshot)

df <- readxl::read_excel("data/Framework.xlsx")

#Robustness Checks

plot_file("Substantive Phase") |> DT::saveWidget( "html-tables/table_sub.html")
plot_file("Structural Phase")|> DT::saveWidget( "html-tables/table_str.html")
plot_file("External Phase")|> DT::saveWidget( "html-tables/table_ext.html")
plot_file("Continuous Evaluation: Robustness Checks")|> DT::saveWidget( "html-tables/table_rob.html")


