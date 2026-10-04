# Polymath Text Analysis

This (workshop) project explores a gentle intro to a Digital Humanities text analysis
workflow using R, RStudio, tidytext, ggplot2, and Quarto.

The project began as an exploration of how computational methods might
help identify patterns across historical texts from different intellectual
traditions. It also serves as a teaching example for introducing text
analysis in digital humanities and digital scholarship.

## Current Corpus

The project currently includes texts by:

- Johann Wolfgang von Goethe — *Theory of Colours*
- Alexander von Humboldt — *Cosmos*
- Mary Somerville — *On the Connexion of the Physical Sciences*
- Ibn Khaldun — *The Muqaddimah*
- Al-Biruni — *Alberuni's India*

The texts were obtained from public-domain digital sources, including
Project Gutenberg.

## What Does the Project Do?

The introductory workflow demonstrates how to:

1. Load plain-text files into R
2. Combine texts into a corpus
3. Tokenize texts into individual words
4. Examine and remove stop words
5. Normalize selected word variations
6. Remove project-specific noise
7. Count word frequencies
8. Visualize patterns with ggplot2
9. Use computational patterns to generate questions for further investigation

## Workshop: Following Along - For attendees that want to follow along for the in person workshop

You do not need prior R experience to explore the project.

If you already have R and RStudio installed:

1. Download or clone this repository.
2. Open the R Project file in RStudio.
3. Open `index.qmd`.
4. Begin at the top of the notebook.
5. Run the code chunks in order.

The source texts used by the notebook are stored in:

`data_raw/`

Because later steps depend on objects created earlier in the notebook,
run the workflow in order.

## Project Structure

    polymath-text-analysis/
    |
    |-- data_raw/       Original text files
    |-- data_clean/     Cleaned or transformed data
    |-- data_output/    Analysis outputs
    |-- plots/          Saved visualizations
    |-- scripts/        R scripts
    |-- index.qmd       Quarto notebook
    |-- index.html      Rendered notebook
    |-- README.md       Project documentation

## Try It With Your Own Text Files for Better Perspective

Once you understand the example workflow, you can adapt it for your own
research.

Start with a plain-text `.txt` file and place it in `data_raw/`.

For example:

    my_text <- read_file("data_raw/my_text.txt")

From there, the same basic workflow can be adapted to tokenize, clean,
count, and visualize your text.

Text cleaning is not completely automatic. Decisions about stop words,
normalization of certain words that the researcher finds, editions, translations, and unexpected tokens depend on
the researcher's corpus and research question. My research is just for fun and to learn and demonstrate R with Text Analysis. 

## Important Methodological Note

Word-frequency analysis can identify patterns, but frequency alone does
not explain meaning or context.

Unexpected results can also reveal issues in the source material or
data preparation. Rather than automatically deleting unusual terms,
return to the original text and investigate why they appear. Using Project Gutenberg, I noticed the plain txt files had a lot of extra text. 

## Tools Used

- R
- RStudio / Posit
- tidyverse
- tidytext
- ggplot2
- Quarto
- GitHub
- Project Gutenberg (where I found my English translated Plaint Text files to download for free, with no Copyright restraints. 

## Project Status

This project is a work in progress. Future development may include
additional female polymaths, translated texts from intellectual traditions
outside Western Europe, additional text-cleaning methods, and more
advanced comparative analysis.
