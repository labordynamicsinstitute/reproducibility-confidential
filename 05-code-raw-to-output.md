(code-raw-to-output)=
# Code from raw data to output

The package must run **from raw inputs to every number in the paper** — no manual steps, no hand edits.

```{margin}
- `estout`, `graph export`, `regsave` in Stata.
- `ggsave`, `png()`, `stargazer` in R.
- See [additional information](https://larsvilhuber.github.io/self-checking-reproducibility/03-automatically_saving_figures.html).
```

- Every table, figure, and in-text statistic produced by code. Never copy-paste from the console.
- Ideally, **one** (or a small number) of entry points (`run.sh` / `main.do`) that runs it all, top to bottom

## Contents of a package (context: FSRDC)

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
data/
  public/
    dist_cepii.dta
    usa_00010.dta
  confidential/
    lbd_2001.dta
    icf_2024.dta
run.sh
```

## Data cleaning code

**All code**, whether used in RDC or not, that was used to manipulate the raw data.

Or maybe there is more code...

```text
README.md
README.pdf
code/
  01-public/
    01-prepare-cepii.do
    02-prepare-ipums.do
  02-fsrdc/
    01-prepare-data.R
    02-analyze-data.R
    03-create-disclosable-data.R
  03-public/
    04-create-tables.do
    05-create-figures.do
    06-create-intext.do
run.sh
```

% TODO: the presentation says "Data cleaning code can be tricky! We will get back to that!" without saying where; the pointer/forward reference is missing (see TODO.md)

## Analysis code

**All code**, whether used in RDC or not.

## Figures and Tables

Create all **final figures and tables** outside the RDC!

Why?

- You do not want to go back just to change the layout!
- Figures are more time-intensive to disclose

## A note or two

- It helps to keep these distinct phases, including the disclosure-prep stage, in mind when writing code
- Separating into different phases of the **final** processing flow can help with organization
- It also makes disclosure avoidance easier
