# Install required packages if not already installed
if (!require("dplyr")) install.packages("dplyr")
if (!require("stringr")) install.packages("stringr")

library(dplyr)
library(stringr)


# URL of Wikipedia page
url <- "https://en.wikipedia.org/wiki/List_of_presidents_of_the_United_States"

source("_read_wikipedia.R",echo=TRUE)

#################################################################
#
#  THIS SECTION CLEANS UP THE NAMES                           
# 
#################################################################

presidents_clean %>%
    mutate(President = case_when(
        str_detect(President, "Jimmy Carter") ~ "James Earl Carter Jr.",
        str_detect(President, "Bill Clinton") ~ "William Jefferson Clinton",
        str_detect(President, "George W. Bush") ~ "George Walker Bush",
        str_detect(President, "Barack Obama") ~ "Barack Hussein Obama II",
        str_detect(President, "Donald Trump") ~ "Donald John Trump",
        str_detect(President, "Joe Biden") ~ "Joseph Robinette Biden Jr.",
        TRUE ~ President
    )) -> presidents_clean


# Save to CSV
write.csv(presidents_clean, "us_presidents.csv", row.names = FALSE)

# Print confirmation message
message("Data has been saved to 'us_presidents.csv'\n")