(final-replication-package)=
# The final replication package

The finished product replication package should have some version of the following contents and structure. It should include all code (whether used in RDC or not), all public data (whether used in RDC or not). A full description can be found [here](https://social-science-data-editors.github.io/template_README/).

```text
README.md
README.pdf
code/
├── fsrdc/
│   ├── 01-prepare-data.R
│   ├── 02-analyze-data.R
│   └── 03-create-disclosable-data.R
├── public/
│   ├── 04-create-tables.do
│   ├── 05-create-figures.do
│   └── 06-create-intext.do
data/
├── public/
│   ├── dist_cepii.dta
│   └── usa_00010.dta
run.sh
```

