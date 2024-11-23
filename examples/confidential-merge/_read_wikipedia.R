# Install required packages if not already installed
if (!require("rvest")) install.packages("rvest")
if (!require("dplyr")) install.packages("dplyr")

library(rvest)
library(dplyr)

# Read the webpage
webpage <- read_html(url)

# Report that it has been read
message("Webpage has been read\n")

# Extract the main presidents table (it's the first table with class 'wikitable')
presidents_table <- webpage %>%
  html_elements(".wikitable") %>%
  .[[1]] %>%
  html_table()

# Clean column names - remove newlines and extra spaces
names(presidents_table) <- c("Order","Portrait","President","Term","empty","Party","Election","Vice President")
presidents_table


# Clean the data
presidents_clean <- presidents_table %>%
  # Remove Portrait Column
    select(-Portrait,-empty) %>%
  # Remove footnote references
  mutate(across(everything(), ~gsub("\\[.*?\\]", "", .)))  %>%
  # Split President column into name and dates
  mutate(
    # Extract dates (anything in parentheses)
    Dates = str_extract(President, "\\(.*?\\)"),
    # Remove parentheses from dates
    Dates = str_remove_all(Dates, "[\\(\\)]"),
    # Clean up the President column to keep only the name
    President = str_remove(President, "\\(.*?\\)"),
    # Trim any remaining whitespace
    President = trimws(President)
  )

# report end of cleaning step
message("Data has been cleaned\n")