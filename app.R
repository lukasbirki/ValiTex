# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file

pkgload::load_all(export_all = FALSE,helpers = FALSE,attach_testthat = FALSE)
options( "golem.app.prod" = TRUE)
options(shinyapps.locale.cache = FALSE)
options("repos")

ValiTex::run_app() # add parameters here (if any)
rsconnect::deployApp()
# rsconnect::deployApp(upload)
#
# devtools::document()
# devtools::check()
# getOption("repos")
# renv::snapshot()
rsconnect::writeManifest()


#repos <- c("local" = "C:/Users/birkenls/Documents/Git-Projekte", "CRAN" = "https://cran.rstudio.com/")
#options(repos = repos)
#

renv::restore()
