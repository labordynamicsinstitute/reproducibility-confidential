(final-replication-package)=
# To start at the end: the final replication package

The finished product replication package should have some version of the following contents and structure (context: FSRDC). A full description of the README can be found [here](https://social-science-data-editors.github.io/template_README/).

```text
README.md
README.pdf
code/
  fsrdc/
    01-prepare-data.R
    02-analyze-data.R
    03-create-disclosable-data.R
  public/
    04-create-tables.do
    05-create-figures.do
    06-create-intext.do
run.sh
data/
  public/
    dist_cepii.dta
    usa_00010.dta
  confidential/
    lbd_2001.dta
    icf_2024.dta
```

- **All code**, whether used in RDC or not
- **All public data**, whether used in RDC or not
- **NONE of the confidential data** present in the RDC
