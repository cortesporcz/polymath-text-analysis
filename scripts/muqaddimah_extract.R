source("scripts/01_setup_packages.R")

pdf_path <- "data_raw/Khaldun_muqaddimah.pdf"
output_txt <- "data_raw/muqaddimah_FINAL.txt"

if (!file.exists(pdf_path)) {
  stop("PDF not found: ", pdf_path)
}

pages <- pdf_text(pdf_path)

cat("Pages extracted:", length(pages), "\n")

start_hits <- which(str_detect(pages, "IN THE NAME OF GOD"))
cat("Potential start pages:", paste(start_hits, collapse = ", "), "\n")

start_page <- 58

main_pages <- pages[start_page:length(pages)]
full_text <- paste(main_pages, collapse = "\n")

clean_text <- full_text %>%
  str_replace_all("\\r", " ") %>%
  str_replace_all("\\n+", "\n") %>%
  str_replace_all("\\s+", " ") %>%
  str_to_lower() %>%
  str_replace_all("\\b\\d+\\b", " ") %>%
  str_replace_all("the muqaddimah", " ") %>%
  str_replace_all("the introduction", " ") %>%
  str_squish()

writeLines(clean_text, output_txt)

cat("Saved cleaned text to:", output_txt, "\n")
cat("Character count:", nchar(clean_text), "\n")
cat("Preview:\n")
cat(substr(clean_text, 1, 700), "\n")
