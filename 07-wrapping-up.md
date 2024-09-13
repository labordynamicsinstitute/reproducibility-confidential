# Wrapping it all up

## Wrapping up

- Public replication package contains intelligible code, omits confidential details (but provides template code), has detailed data provenance statements
- Confidential replication package contains all the same, plus the confidential code, is archived in the FSRDC

## Things to remember

- Use code to save figures and tables (`estout`, `graph export`, `regsave`)
- Create log files for each run (`stata -b do file.do` not fine-grained enough) [link](https://github.com/AEADataEditor/replication-template/blob/master/template-config.do#L88)

## Things to remember

- When doing a disclosure review request, remember to request the **code**
- When outputting statistics, *consider the disclosure rules* - the less changes, the faster the output (in theory), but in particular fewer surprises
- Do not think "*nobody will ever read this code*" - somebody is very likely to!


# End

Now you wait for the replicators to show up!
