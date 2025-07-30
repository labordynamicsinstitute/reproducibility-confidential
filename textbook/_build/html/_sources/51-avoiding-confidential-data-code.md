(avoiding-confidential-data-code)=
# Avoiding confidential data in your code

## The problem
We often see code that “fixes” problems in the data by hard-coding a mapping:


```R
# ... 1000 lines of code above...
# Bad practice
data$name[data$name == "Joe Biden"] <- "Joseph Robinette Biden Jr."
data$county[data$county == "Tompins, NY"] <- "Tompkins County, NY"
# ... 500 lines of code below ...
```

Why is this a problem? The information in columns `name` or `county` might be confidential. By coding this information as part of your programs, you have made the **code** confidential! And so you may now have to redact the code before releasing.

### One solution
As before, you might move this code into a separate file:

```R
# ... 1000 lines of code above...
# Better practice
source("confidential/mappings.R")
# ... 500 lines of code below ...
```

### Better solution
If you realize that the mapping is actually **data**, then treating it as any other data (much of which might also be confidential) is both more robust and more manageable while being secure.

```R
if (!file.exists("data/confidential/names_mapping.csv")) {
    names_confidential %>% 
        left_join(read_csv("data/confidential/names_mapping.csv"), by = "name") %>%
        # replace name with name_alt if the latter is not NA
        mutate(name = if_else(!is.na(name_alt), name_alt, name)) %>%
        # drop the name_alt column
        select(-name_alt) -> names_clean
}
```

**Note:** You may still want to de-identify the data before releasing it! The code, however, is now **free of confidential information**.

See [sample R code in this Github repository](https://github.com/labordynamicsinstitute/reproducibility-confidential/tree/main/examples/confidential-merge) for an example where we treat presidents' names as confidential data.




