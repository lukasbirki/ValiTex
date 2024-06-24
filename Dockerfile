FROM rocker/verse:4.3.1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libxml2-dev \
    make \
    pandoc \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up R repository options
RUN mkdir -p /usr/local/lib/R/etc/ /usr/lib/R/etc/
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site

# Install remotes package
RUN R -e 'install.packages("remotes")'

# Install specific package versions
RUN Rscript -e 'remotes::install_version("shiny", upgrade = "never", version = "1.7.5")'
RUN Rscript -e 'remotes::install_version("config", upgrade = "never", version = "0.3.2")'
RUN Rscript -e 'remotes::install_version("htmlwidgets", upgrade = "never", version = "1.6.2")'
RUN Rscript -e 'remotes::install_version("testthat", upgrade = "never", version = "3.1.10")'
RUN Rscript -e 'remotes::install_version("spelling", upgrade = "never", version = "2.2.1")'
RUN Rscript -e 'remotes::install_version("shinyjs", upgrade = "never", version = "2.1.0")'
RUN Rscript -e 'remotes::install_version("prompter", upgrade = "never", version = "1.1.0")'
RUN Rscript -e 'remotes::install_version("golem", upgrade = "never", version = "0.4.1")'
RUN Rscript -e 'remotes::install_version("faq", upgrade = "never", version = "0.1.1")'
RUN Rscript -e 'remotes::install_version("DT", upgrade = "never", version = "0.29")'
RUN Rscript -e 'remotes::install_version("dplyr", upgrade = "never", version = "1.1.2")'

# Create build directory and add current directory to it
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone

# Restore renv environment
RUN R -e 'renv::restore()'

# Ensure remotes is installed within renv
RUN R -e 'install.packages("remotes")'

# Install the local package
RUN R -e 'remotes::install_local("/build_zone", upgrade = "never")'

# Clean up build directory
RUN rm -rf /build_zone

# Set the command to run your Shiny app
CMD R -e "options('shiny.port'=$PORT, shiny.host='0.0.0.0'); library(ValiTex); ValiTex::run_app()"
