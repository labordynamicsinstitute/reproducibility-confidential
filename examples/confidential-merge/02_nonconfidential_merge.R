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

# The file "presidents_mapping.csv" is "confidential".
# The creation of this file is done here in a separate script, which then also is confidential,
# but might also be the output of a very manual process, created by hand.

source("_create_mapping.R",echo=TRUE)

# Merge the mapping

if (!file.exists("presidents_mapping.csv")) {
    presidents_clean %>% 
        left_join(read_csv("presidents_mapping.csv"), by = "President") %>%
        # replace President with President_alt if the latter is not NA
        mutate(President = if_else(!is.na(President_alt), President_alt, President)) %>%
        # drop the President_alt column
        select(-President_alt) -> presidents_clean
}

# Save to CSV
write.csv(presidents_clean, "us_presidents.csv", row.names = FALSE)

# Print confirmation message
message("Data has been saved to 'us_presidents.csv'\n")