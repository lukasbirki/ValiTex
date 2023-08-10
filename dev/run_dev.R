# Set options here
options(golem.app.prod = FALSE) # TRUE = production mode, FALSE = development mode

# Comment this if you don't want the app to be served on a random port
#options(shiny.port = httpuv::randomPort())

# Detach all loaded packages and clean your environment
golem::detach_all_attached()
# rm(list=ls(all.names = TRUE))

# Document and reload your package
golem::document_and_reload()

# Run the application
run_app()

install.packages("devtools")
devtools::install_github("lukasbirki/ValiTex", force = T)

library(valitex)
valitex::run_app()

devtools::check()

devtools::check()

pkgbuild::check_build_tools(debug = TRUE)

Sys.getenv("PATH")
R.version

installrinstall.packages("installr")
installr::updateR()
remotes::install_local(force = T)

library(ValiTex)
run_app()
golem::add_shinyappsio_file()
