<img src="inst/app/www/logo_valitex.png" align="right" width="15%" height="15%"/>

<!-- badges: start -->
[![Project Status: Active -- The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![DOI](https://zenodo.org/badge/634831162.svg)](https://zenodo.org/badge/latestdoi/634831162)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![R-CMD-check](https://github.com/lukasbirki/ValiTex/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lukasbirki/ValiTex/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

# ValiTex Checklist

This repository contains the online checklist of the [ValiTex](https://lukasbirki.shinyapps.io/ValiTex/) framework for
validating text-based measures of social science constructs by
[Birkenmaier et al. (2023)](https://arxiv.org/abs/2307.02863). The validation framework is designed to assist scholars in validly measuring social science constructs based on textual data. 

## User Instructions

### Installation

You can run the online checklist locally on your machine using R.
You can install the package holding the shiny application directly from
Github using the `install_github` function from the `devtools` package
as shown below. Please make sure, that you have the `devtools` package
locally installed on your machine before starting the download.

``` r
# To install the package
install.packages("devtools")
devtools::install_github("lukasbirki/ValiTex")

# To load the package and data
library(ValiTex)
ValiTex::run_app()

```

## User Instructions

This application generates an adaptable checklist that you can use to
validate your text-based measures. Each row within the table corresponds
to one validation step (i.e., a single reported and clearly demarcated
validation activity). Validation steps can be either mandatory or
optional depending on their relevance. As outlined in the corresponding
paper, researchers should initially follow the order of the phases,
starting with the substantive validation steps and ending with external
validation steps while continuously considering robustness checks.
However, researchers might adapt this process to their individual use
case.
### Use Cases

ValiTex accounts for differences in validation practices across
text-based methods and research contexts. At present, ValiTex
differentiates between seven use cases:

<style>
table {
  font-size: 0.9em; /* Adjust the font size to your preference */
  /* Add other CSS styles here if needed */
}
</style>

| # | Use Case                                          | Learning Approach              | Training / Finetuning Data Required | Known Output Categories | Description                                           | Example                                                |
|---|---------------------------------------------------|--------------------------------|----------------------------------|-------------------------|-------------------------------------------------------|--------------------------------------------------------|
| A | Applying Dictionaries                             | Rule-Based                     | No                               | Yes                     | Assign scores to text units using predefined word lists | A dictionary assigns polarity values ranging from -1 to 1 to each known text unit |
| B | Classification using Traditional Supervised ML    | Supervised                     | Yes                              | Yes                     | Assign known output categories based on labelled training data | A Logistic regression model is trained on labelled customer reviews and predicts "positive" and "negative" reviews |
| C | Classification using Fine-tuned ML Model          | Semi-Supervised                | Yes                              | Yes                     | Assign known output categories based on a fine-tuning process on a small subset of labelled data | A pretrained BERT model is fine-tuned on labelled social media posts and predicts "offensive" and "non-offensive" posts |
| D | Zero-Shot/Few-Shot Classification (known categories) | Semi-Supervised             | No                               | Yes                     | Assign known output categories without any finetuning on labelled data | GPT-3 predicts "political" or "non-political" speeches |
| E | Zero-Shot/Few-Shot Classification (unknown categories) | Unsupervised               | No                               | No                      | Assign unknown output categories without any finetuning on labelled data | GPT-3 suggests topics for texts (not prescribed by the researcher) |
| F | Topic Modelling                                    | Unsupervised                  | No                               | No                      | Assign topics without any labeled data                 | An LDA topic model generates 13 coherent topics       |
| G | Text Scaling                                      | Unsupervised                  | No                               | Yes                     | Assign scale scores without any labelled data          | A Wordfish model assigns scale values from -1 to 1 to politicians’ speeches |


The complete list of validation steps is also available on
[Github](https://github.com/lukasbirki/ValiTex-Checklist/tree/main/data)
