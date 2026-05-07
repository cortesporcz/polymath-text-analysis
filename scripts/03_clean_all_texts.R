source("scripts/01_setup_packages.R")

texts <- tibble(
  author = c("Khaldun", "Goethe", "Humboldt", "Somerville"),
  file = c(
    "data_raw/muqaddimah_FINAL.txt",
    "data_raw/goethe_colours.txt",
    "data_raw/humboldt_cosmos_vol1.txt",
    "data_raw/somerville_connexion.txt"
  )
)

read_text_file <- function(path) {
  paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = " ")
}

clean_text_function <- function(text) {
  text %>%
    str_to_lower() %>%
    str_replace_all("\\r", " ") %>%
    str_replace_all("\\n+", " ") %>%
    str_replace_all("\\s+", " ") %>%
    str_replace_all("\\b\\d+\\b", " ") %>%
    str_replace_all("[^[:alpha:] ]", " ") %>%
    str_squish()
}

all_texts <- texts %>%
  mutate(
    raw_text = map_chr(file, read_text_file),
    clean_text = map_chr(raw_text, clean_text_function)
  )

write_csv(all_texts, "data_clean/all_clean_texts.csv")

cat("Saved cleaned texts to data_clean/all_clean_texts.csv\n")
source("scripts/05_theme_analysis.R")

