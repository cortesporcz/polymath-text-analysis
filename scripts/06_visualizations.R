source("scripts/01_setup_packages.R")


theme_data <- read_csv(
  "data_output/theme_counts_normalized.csv",
  show_col_types = FALSE
)

#Create the plot object
selected_theme_plot <- theme_data %>%
  filter(theme %in% c("nature", "science", "systems")) %>%
  ggplot(aes(x = author,
             y = proportion,
             fill = theme)) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(
    title = "Nature, Science, and Systems Across Polymaths",
    x = "Author",
    y = "Normalized Proportion"
  )

#Display the plot
selected_theme_plot

#Save the plot
ggsave(
  "plots/nature_science_systems_by_author.png",
  plot = selected_theme_plot,
  width = 10,
  height = 6
)

top_words <- read_csv(
  "data_output/top_words_by_author.csv",
  show_col_types = FALSE
)

top_10 <- top_words %>%
  group_by(author) %>%
  slice_head(n = 10) %>%
  ungroup()

top_words_plot <- ggplot(top_10,
                         aes(x = reorder(word, n),
                             y = n,
                             fill = author)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  facet_wrap(~author, scales = "free") +
  theme_minimal() +
  labs(
    title = "Top Words by Polymath",
    x = "Word",
    y = "Frequency"
  )

theme_data <- read_csv(
  "data_output/theme_counts_normalized.csv",
  show_col_types = FALSE
)

#save this plot
ggsave(
  "plots/top_words_by_polymath.png",
  plot = top_words_plot,
  width = 10,
  height = 6
)

theme_distribution_plot <- ggplot(theme_data,
                                  aes(x = theme,
                                      y = proportion,
                                      fill = author)) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(
    title = "Theme Distribution Across Polymaths",
    x = "Theme",
    y = "Normalized Proportion"
  )
theme_distribution_plot

theme_data %>%
  filter(theme %in% c("nature", "science", "systems")) %>%
  ggplot(aes(x = author,
             y = proportion,
             fill = theme)) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(
    title = "Nature, Science, and Systems Across Polymaths",
    x = "Author",
    y = "Normalized Proportion"
  )
ggsave(
  "plots/top_words_by_polymath.png",
  plot = top_words_plot,
  width = 10,
  height = 6
)

ggsave(
  "plots/theme_distribution_across_polymaths.png",
  plot = theme_distribution_plot,
  width = 10,
  height = 6
)

ggsave("plots/theme_distribution_across_polymaths.png", plot = theme_distribution_plot)

ggsave("plots/nature_science_systems_by_author.png", plot = selected_theme_plot)
