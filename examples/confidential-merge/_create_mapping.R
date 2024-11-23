# Create mapping.
# This could also manually create the file.

# Install required packages if not already installed
if (!require("dplyr")) install.packages("dplyr")
if (!require("stringr")) install.packages("stringr")

library(dplyr)
library(stringr)


if (!file.exists("presidents_mapping.csv")) {
    presidents_clean %>% 
        select(President) %>% 
        distinct() %>%
        mutate(President_alt = case_when(
            str_detect(President, "Jimmy Carter") ~ "James Earl Carter Jr.",
            str_detect(President, "Bill Clinton") ~ "William Jefferson Clinton",
            str_detect(President, "George W. Bush") ~ "George Walker Bush",
            str_detect(President, "Barack Obama") ~ "Barack Hussein Obama II",
            str_detect(President, "Donald Trump") ~ "Donald John Trump",
            str_detect(President, "Joe Biden") ~ "Joseph Robinette Biden Jr.",
            TRUE ~ NA
        )) %>% 
        filter(!is.na(President_alt)) %>%
        write.csv("presidents_mapping.csv")

        
    # Print confirmation message
    message("Mapping has been created\n")
} else {
    # Print confirmation message
    message("Mapping already exists\n")
}