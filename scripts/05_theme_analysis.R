source("scripts/01_setup_packages.R")

# Make sure output folder exists
dir.create("data_output", showWarnings = FALSE)

# Load token data
tokens <- read_csv(
  "data_clean/all_tokens_nostop.csv",
  show_col_types = FALSE
)

# -------------------------
# DEFINE THEMES
# -------------------------

themes <- list(
  nature = c("nature", "earth", "world", "climate", "environment", "natural"),
  
  science = c("science", "knowledge", "observation", "experiment", "study", "fact"),
  
  systems = c("system", "order", "structure", "relation", "connection", "process"),
  
  change = c("change", "growth", "development", "transformation", "evolution"),
  
  human_society = c("human", "people", "society", "civilization", "community"),
  
  philosophy = c("truth", "reason", "understanding", "principle", "idea")
)

# -------------------------
# APPLY THEMES
# -------------------------

theme_counts <- tokens %>%
  mutate(theme = case_when(
    word %in% themes$nature ~ "nature",
    word %in% themes$science ~ "science",
    word %in% themes$systems ~ "systems",
    word %in% themes$change ~ "change",
    word %in% themes$human_society ~ "human_society",
    word %in% themes$philosophy ~ "philosophy",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(theme)) %>%
  count(author, theme, sort = TRUE)

# -------------------------
# NORMALIZE COUNTS
# -------------------------

theme_counts_normalized <- theme_counts %>%
  group_by(author) %>%
  mutate(proportion = n / sum(n)) %>%
  ungroup()

# -------------------------
# SAVE FILES
# -------------------------

write_csv(
  theme_counts,
  "data_output/theme_counts_raw.csv"
)

write_csv(
  theme_counts_normalized,
  "data_output/theme_counts_normalized.csv"
)

# -------------------------
# PREVIEW
# -------------------------

print(theme_counts_normalized)

cat("\nTheme analysis complete.\n")

