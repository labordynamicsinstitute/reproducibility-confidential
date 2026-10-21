(wrapping-up)=
# Wrapping up

- Public replication package contains intelligible code, omits confidential details (but provides template code), has detailed data provenance statements
- Confidential replication package contains confidential code and possibly data, is archived in the RDC

## Things to remember

- Use code to save figures and tables (`estout`, `graph export`, `regsave`).
- Create log files for each run (`stata -b do file.do` not fine-grained enough) ([tutorial](https://larsvilhuber.github.io/self-checking-reproducibility/04-creating_log_files.html), [example](https://github.com/AEADataEditor/replication-template/blob/master/template-config.do#L88)).
- Run it all again, top to bottom!
- When doing a disclosure review request, remember to request the **code**.
- When outputting statistics, *consider the disclosure rules* - the less changes, the faster the output (in theory), but in particular fewer surprises.
- Do not think *“nobody will ever read this code”* - somebody is very likely to!

## End

Now you wait for the replicators to show up!
