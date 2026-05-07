


if (!file.exists("data_clean/all_clean_texts.csv")) {
  stop("Missing file: data_clean/all_clean_texts.csv")
}

all_texts <- read_csv("data_clean/all_clean_texts.csv", show_col_types = FALSE)

tokens_all <- all_texts %>%
  select(author, clean_text) %>%
  unnest_tokens(word, clean_text)

tokens_nostop <- tokens_all %>%
  anti_join(stop_words, by = "word") %>%
  filter(str_detect(word, "[a-z]")) %>%
  filter(str_length(word) > 2)

write_csv(tokens_all, "data_clean/all_tokens_raw.csv")
write_csv(tokens_nostop, "data_clean/all_tokens_nostop.csv")

top_words <- tokens_nostop %>%
  count(author, word, sort = TRUE)

write_csv(top_words, "data_output/top_words_by_author.csv")

cat("Saved:\n")
cat("- data_clean/all_tokens_raw.csv\n")
cat("- data_clean/all_tokens_nostop.csv\n")
cat("- data_output/top_words_by_author.csv\n")
cat("\nPreview of top words:\n")
print(top_words %>% group_by(author) %>% slice_head(n = 10))


