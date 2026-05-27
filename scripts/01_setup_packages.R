cat("Current working directory:\n")
print(getwd())

# Install and load packages

packages <- c(
  "tidyverse",
  "tidytext",
  "stringr",
  "pdftools",
  "quanteda",
  "readr"
)

to_install <- packages[!packages %in% installed.packages()[, "Package"]]

if (length(to_install) > 0) {
  install.packages(to_install)
}

invisible(lapply(packages, library, character.only = TRUE))